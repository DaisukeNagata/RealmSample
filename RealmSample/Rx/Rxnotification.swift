//
//  RxNotification.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/02.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class RxNotification {
    
    static var rxNotification = RxNotification()
    var dis = DisposeBag()
    
    func Rxnotification(vc: ViewController?,frame:CGRect)  {
        // オブザーバーでframeChange
         let willChangeFrame = NotificationCenter.default.rx.notification(UIResponder.keyboardWillChangeFrameNotification)
            .map { notification -> CGRect in
                vc?.setFiledtType?.button.frame = frame
                UIApplication.shared.windows.last?.addSubview((vc?.setFiledtType?.button ?? UIButton()))
                UIView.animate(withDuration: (((notification.userInfo! as NSDictionary).object(forKey: UIResponder.keyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                }, completion: { (complete) -> Void in
                })
                return  frame
        }
        // frameのシーケンスにマージ
        Observable.of(willChangeFrame).merge()
            .bind(to: Variable<CGRect>(frame))
            .disposed(by: dis)
        
    }
    deinit {
        print("")
    }
}
