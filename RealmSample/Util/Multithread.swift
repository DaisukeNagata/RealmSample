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
    
    var magnificationString:String{get set}
    //メソッド設定
    func magnificationSetString()->String
}

//Doubleを設定するprotocol
protocol setText {
    
    var magnification:Double{get set}
    func magnificationSet()->Double
}

//Labelを管理するクラス

class Suusiki:setText {
  
    internal var magnification: Double = (Double(MagnificationView().threadLabel.text!))!
    internal var magnificationTwo: Double =  (Double(MagnificationView().threadLabelTwo.text!))!
    internal func magnificationSet() -> Double {
        
        return  magnification
    }
    internal func magnificationSetTwo() -> Double {
        
        return  magnificationTwo
        
    }
}
//realmを使用するためのクラスを作る（String）
class realmSusikiString:setTextString {
    
    internal var magnificati =  RealmModel.realm.usersSet[RealmModel.index.indexSet]
    internal var magnificationString =  RealmModel.realm.usersSet[RealmModel.index.indexSet].ID
    
    internal func magnificationSetString() -> String {
        
        return  magnificationString
        
    }
    
    internal func magni() -> realmDataSet {
        
        return  magnificati
        
    }
}

//realmを使用するためのクラスを作る.（Double）
class realmSusiki:setText {
    
    internal var magnification: Double =  (Double(RealmModel.realm.usersSet[RealmModel.index.indexSet].ID))!
    
    internal func magnificationSet() -> Double {
        
        return  magnification
        
    }
    
}
