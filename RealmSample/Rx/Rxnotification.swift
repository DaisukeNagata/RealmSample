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

class RxNotification : NSObject{
    static var rxNotification = RxNotification()
    var dis = DisposeBag()
    
    func Rxnotification(button:ViewController,frame:CGRect)  {
        // オブザーバーでframeChange
        let willChangeFrame = NotificationCenter.default.rx.notification(.UIKeyboardWillChangeFrame)
            .map { notification -> CGRect in
                button.button.frame = frame
                UIApplication.shared.windows.last?.addSubview(button.button)
                UIView.animate(withDuration: (((notification.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                }, completion: { (complete) -> Void in
                })
                return  frame
        }
        // frameのシーケンスにマージ
        Observable.of(willChangeFrame).merge()
            .bindTo(Variable<CGRect>(frame))
            .addDisposableTo(dis)
    }
}
