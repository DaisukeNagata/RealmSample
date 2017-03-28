//
//  MagnificationViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/10.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit
//モデルリングの準備

protocol MagnificationModeling {
    
    //数値クリア
    func clearSuti()
    func deleate()
    func wari(Index:Int)
    func cast(Index:Int)
    var vc: ViewController { get }
}

class MagnificationViewModel : MagnificationModeling {
    internal var vc: ViewController{return self.vc}
    
    func clearSuti(){
        vc.totalTax.text? = "0"
        vc.totalCount = 0
    }
    func deleate(){
        try!RealmModel.realm.realmTry.write {
            RealmModel.realm.realmTry.delete(realmSusikiString().magni())
        }
    }
    func wari(Index:Int){
        if  vc.setFiledtType.threadLabelTwo.text != "0" && vc.textSet.text! != "" {
            
            try!RealmModel.realm.realmTry.write {
                
                RealmModel.realm.usersSet[Index].ID =  ((Double( RealmModel.realm.usersSet[Index].ID))! / Suusiki().magnificationTwo).description
                
                clearSuti()
                
                vc.totalTax.text? = vc.totalCount.description
                vc.tableViewSetting.reloadData()
            }
        }
    }
    func cast(Index:Int){
        //数値設定
        clearSuti()
        
        if   vc.setFiledtType.threadLabel.text != "0" && vc.textSet.text! != "" {
            print(Suusiki().magnification*realmSusiki().magnification)
            try!RealmModel.realm.realmTry.write {
                RealmModel.realm.usersSet[Index].ID = (Suusiki().magnification*realmSusiki().magnification).description
                
            }
        }
        
        
        if vc.textSet.text! != ""  &&  vc.setFiledtType.threadLabel.text == "0" && vc.setFiledtType.threadLabelTwo.text == "0" {
            try!RealmModel.realm.realmTry.write {
                RealmModel.realm.usersSet[Index].ID = vc.textSet.text!
            }
        }
        wari(Index:Index)
        vc.totalTax.text? = vc.totalCount.description
        vc.tableViewSetting.reloadData()
    }
    
}

class MagnificationView: UIView,UITextFieldDelegate {
    
    var setFiled = TextField()
    let button = Button().button
    var threadLabel = Label().threadLabel
    var threadLabelTwo = Label().threadLabelTwo
    var view = UIView()
    
    override init (frame:CGRect){
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
