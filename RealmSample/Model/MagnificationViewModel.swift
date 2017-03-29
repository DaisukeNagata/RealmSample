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
    func deleate()
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
    func deleate(){
        try!RealmModel.realm.realmTry.write {
            RealmModel.realm.realmTry.delete(realmSusikiString().magni())
        }
    }
    
    func wari(Index:Int){
        if  ViewController.vcView.setFiledtType.threadLabelTwo.text != "0" &&  vc?.textSet.text! != "" {
            
            try!RealmModel.realm.realmTry.write {
            
                RealmModel.realm.usersSet[Index].ID =  ((Double( RealmModel.realm.usersSet[Index].ID))! / Suusiki().magnificationTwo).description
                
                clearSuti()
                
                vc?.totalTax.text? =  (vc?.totalCount.description)!
                 vc?.tableViewSetting.reloadData()
            }
        }
    }
    
    func cast(Index:Int){

        clearSuti()
        
        if  ViewController.vcView.setFiledtType.threadLabel.text != "0" &&  vc?.textSet.text! != "" {
            print(Suusiki().magnification*realmSusiki().magnification)
            try!RealmModel.realm.realmTry.write {
                RealmModel.realm.usersSet[Index].ID = (Suusiki().magnification*realmSusiki().magnification).description
            }
        }
        
        if  vc?.textSet.text! != ""  &&   ViewController.vcView.setFiledtType.threadLabel.text == "0" &&  ViewController.vcView.setFiledtType.threadLabelTwo.text == "0" {
            try!RealmModel.realm.realmTry.write {
                RealmModel.realm.usersSet[Index].ID =  (vc?.textSet.text!)!
            }
        }
        wari(Index:Index)
         vc?.totalTax.text? =  (vc?.totalCount.description)!
         vc?.tableViewSetting.reloadData()
    }
    
}
