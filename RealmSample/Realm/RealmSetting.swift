//
//  RealmSetting.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/03.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import RxSwift

class RealmSetting{
    func RealmCreate(now:NSDate,text:String,text2:String){
        try!RealmModel.realm.realmTry.write {
            RealmModel.realm.realmTry.create(realmDataSet.self,value: [now,text,text2] as [Any])
        }
    }
    
    func RealmthreadLabel(text:String,Index:Int){
        try!RealmModel.realm.realmTry.write {
             RealmModel.realm.usersSet[Index].ID = text
        }
    }
    
    func RealmDeleate(indexPath: IndexPath){
        try!RealmModel.realm.realmTry.write {
            RealmModel.realm.realmTry.delete(RealmModel.realm.usersSet[indexPath.row])
        }
    }
}
