//
//  RealmModel.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/28.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import RealmSwift

//realmを使用するクラス
class realmDataSet: Object {
    
    dynamic var now = NSDate()
    dynamic var ID = String()
    dynamic var Message = String()
    //プロパティを増やす場合は、schemaVersionをUpさせて追加する。プロパティ名を変更する際は/*https://realm.io/docs/swift/latest/#migrations*/の詳細を参照する。
    dynamic var Message2 = String()
    
}

struct RealmModel {
    //realmを使用するためのクラスを作る
    struct realm{
        static var realmTry = try!Realm()
        static var realmsset = realmDataSet()
        static var usersSet =  RealmModel.realm.realmTry.objects(realmDataSet.self)
    }
    struct index{
        static var indexSet : Int = 0
    }
}