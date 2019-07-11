//
//  RxButton.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/02.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

struct RxButton {
    
    static var rxButton = RxButton()
 
    func Rxbutton(sender: UIButton?,viewModel: MagnificationViewModel?,views: ViewController?,now:NSDate?){
        DispatchQueue.main.async { () -> Void in
            if views?.textSet?.text! != ""{
                viewModel?.clearSuti()
                RealmSetting().RealmCreate(now: now!, text: views?.textSet?.text ?? "" ,text2: "")
                views?.tableViewSetting.reloadData()
                RealmModel.realm.bool = true
                views?.textSet?.resignFirstResponder()
                views?.setFiledtType?.setField.resignFirstResponder()
                sender?.removeFromSuperview()
            }
        }
    }
}
