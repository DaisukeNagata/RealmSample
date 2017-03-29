//
//  proTest.swift
//  marutiSured
//
//  Created by 永田大祐 on 2016/10/09.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import Foundation


//Stringを設定するprotocol
protocol setTextString {
    
    //メソッド設定
    func magni()->realmDataSet
}

//Doubleを設定するprotocol
protocol setTextModel {
    
    var magnification:Double{get set}
    func magnificationSet()->Double
    
}

//Labelを管理するクラス

class Suusiki:setTextModel  {
    
    var magnification: Double = (Double(ViewController.vcView.setFiledtType.threadLabel.text!))!
    var magnificationTwo: Double =  (Double(ViewController.vcView.setFiledtType.threadLabelTwo.text!))!
    func magnificationSet() -> Double {
        
        return  magnification
    }
    
    internal func magnificationSetTwo() -> Double {
        
        return  magnificationTwo
        
    }
}

//realmを使用するためのクラスを作る（String）
class realmSusikiString:setTextString {
    
    internal var magnificati =  RealmModel.realm.usersSet[RealmModel.index.indexSet]
    
    internal func magni() -> realmDataSet {
        
        return  magnificati
    }
}

//realmを使用するためのクラスを作る.（Double）
class realmSusiki:setTextModel {
    internal static var vc: ViewController?
    
    internal var magnification: Double =  (Double(RealmModel.realm.usersSet[RealmModel.index.indexSet].ID))!
    
    internal func magnificationSet() -> Double {
        
        return  magnification
        
    }
    
}
