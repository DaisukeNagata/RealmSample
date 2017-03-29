//
//  RealmModel.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/28.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import RealmSwift


class realmDataSet: Object {
    
    dynamic var now = NSDate()
    dynamic var ID = String()
    dynamic var Message = String()
    dynamic var Message2 = String()
    
}

struct RealmModel {

    struct realm{
        static var realmTry = try!Realm()
        static var realmsset = realmDataSet()
        static var usersSet =  RealmModel.realm.realmTry.objects(realmDataSet.self)
    }
    
    struct index{
        static var indexSet : Int = 0
    }
}
