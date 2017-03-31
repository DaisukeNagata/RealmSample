//
//  proTest.swift
//  marutiSured
//
//  Created by 永田大祐 on 2016/10/09.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import Foundation

protocol setTextString {

    func magni()->realmDataSet
    
}


protocol setTextModel {
    
    var magnification:Double{get set}
    func magnificationSet()->Double
    
}



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


class realmSusikiString:setTextString {
    
    internal var magnificati =  RealmModel.realm.usersSet[RealmModel.index.indexSet]
    
    internal func magni() -> realmDataSet {
        
        return  magnificati
    }
}


class realmSusiki:setTextModel {
    internal static var vc: ViewController?
    
    internal var magnification: Double =  (Double(RealmModel.realm.usersSet[RealmModel.index.indexSet].ID))!
    
    internal func magnificationSet() -> Double {
        
        return  magnification
        
    }
    
}
