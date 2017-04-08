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
    
    func magnificationSet(Index:Int)->Double
    
}


class realmSusikiString:setTextString {
    
    internal var magnificati =  RealmModel.realm.usersSet[RealmModel.index.indexSet]
    
    internal func magni() -> realmDataSet {

        return  magnificati
    }
}


class realmSusiki:setTextModel {
    
    
    internal func magnificationSet(Index:Int) -> Double {
        
        let magnification: Double =  (Double(RealmModel.realm.usersSet[Index].ID))!
        
        return  magnification
        
    }
}
