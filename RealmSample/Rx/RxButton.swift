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
    var dis = DisposeBag()
    
    func Rxbutton(sender: UIButton,textSet:UITextField,viewModel:MagnificationViewModel,tableViewSetting:UITableView,now:NSDate){
            DispatchQueue.main.async { () -> Void in
                if textSet.text! != ""{
                    viewModel.clearSuti()
                    
                    try! RealmModel.realm.realmTry.write {
                        RealmModel.realm.realmTry.create(realmDataSet.self,value: [now,textSet.text!] as [Any])
                        tableViewSetting.reloadData()
                    }
                }
            }
            textSet.resignFirstResponder()
        }
    }
