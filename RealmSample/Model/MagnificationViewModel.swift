//
//  MagnificationViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/10.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit

protocol MagnificationModeling {
    
    func clearSuti()
    func wari(Index:Int)
    func cast(Index:Int)
    
}

class MagnificationViewModel : MagnificationModeling {
    
    weak var vc: ViewController?
    func attachViewSet(vc: UIViewController) {
        self.vc = vc as? ViewController
    }
    
    func clearSuti(){
        vc?.totalTax?.text! = "0"
        vc?.totalCount = 0
    }
    
    func wari(Index:Int){
        
        if  vc?.setFiledtType.setFiled.text! != "0" &&  vc?.textSet.text! != "" && vc?.textSet.text! != nil  &&  vc?.setFiledtType.setFiled.text != nil {
            RealmSetting().RealmthreadLabel(text: ((Double( RealmModel.realm.usersSet[Index].ID))! / Double((vc?.setFiledtType.setFiled.text!)!)!).description, Index: Index)
            
            clearSuti()
            
            vc?.totalTax?.text? =  (vc?.totalCount.description)!
            vc?.tableViewSetting.reloadData()
            
        }
    }
    
    func cast(Index:Int){
        
        clearSuti()
        
        if  RealmModel.realm.usersSet[Index].ID != "0" &&  vc?.textSet.text! != "" {
            let threadLabel = Double(RealmModel.realm.usersSet[Index].ID)! * Double((vc?.textSet.text)!)!
            RealmSetting().RealmthreadLabel(text:threadLabel.description, Index: Index)
        }
        
        if  RealmModel.realm.usersSet[Index].ID == "0" && vc?.textSet.text! != "" {
            RealmSetting().RealmthreadLabel(text: (vc?.textSet.text!)!, Index: Index)
        }
        
        wari(Index:Index)
        vc?.totalTax?.text? =  (vc?.totalCount.description)!
        vc?.tableViewSetting.reloadData()
    }
    deinit {
        print("deinit1")
    }
}
