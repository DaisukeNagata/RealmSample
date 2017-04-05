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
    func attachViewSet(vc: ViewController) {
        self.vc = vc
    }
    
    func clearSuti(){
        vc?.totalTax.text! = "0"
        vc?.totalCount = 0
    }
    
    func wari(Index:Int){
        
        if  ViewController.vcView.setFiledtType.threadLabelTwo.text != "0" &&  vc?.textSet.text! != "" {
            RealmSetting().RealmthreadLabel(text: ((Double( RealmModel.realm.usersSet[Index].ID))! / Suusiki().magnificationTwo).description, Index: Index)
            
            clearSuti()
            
            vc?.totalTax.text? =  (vc?.totalCount.description)!
            vc?.tableViewSetting.reloadData()
            
        }
    }
    
    func cast(Index:Int){
        
        clearSuti()
        
        if  ViewController.vcView.setFiledtType.threadLabel.text != "0" &&  vc?.textSet.text! != "" {
            RealmSetting().RealmthreadLabel(text: (Suusiki().magnification*realmSusiki().magnificationSet(Index: Index)).description,Index: Index)
        }
        
        if  vc?.textSet.text! != ""  &&   ViewController.vcView.setFiledtType.threadLabel.text == "0" &&  ViewController.vcView.setFiledtType.threadLabelTwo.text == "0" {
            RealmSetting().RealmthreadLabel(text: (vc?.textSet.text!)!, Index: Index)
            
        }
        
        wari(Index:Index)
        vc?.totalTax.text? =  (vc?.totalCount.description)!
        vc?.tableViewSetting.reloadData()
    }
    
}
