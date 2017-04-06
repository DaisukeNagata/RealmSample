//
//  RealmSetting.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/03.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RealmSetting{
    
    static var realmSetting = RealmSetting()
    var notificationToken: NotificationToken?
    
    func RealmNOtification(views:ViewController){
        RealmThread(views:views)
    }
    
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
    //RealmNotification
    private func RealmThread(views:ViewController){
        notificationToken = RealmModel.realm.usersSet.addNotificationBlock { change in
            if views.totalCount > 1000.0{
                views.tableViewSetting.backgroundColor = UIColor.purple
            }else if views.totalCount < 1{
                views.tableViewSetting.backgroundColor = UIColor.white
            }
        }
    }
    deinit {
        notificationToken?.stop()
    }
}
