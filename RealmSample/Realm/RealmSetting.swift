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
    var timer = Timer()
    var viewsSet:ViewController?
    func RealmNOtification(views:ViewController){
        RealmThread(views:views)
    }
    
    func RealmAdd(text:String,Index:IndexPath,now:NSDate){
        try!RealmModel.realm.realmTry.write {
        RealmModel.realm.usersSet[Index.row].ID = text
        }
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
        viewsSet = views
        notificationToken = RealmModel.realm.usersSet.addNotificationBlock { [weak self] change in
            print(views.totalCount)
            if views.totalCount > 1000.0{
                    views.view.addSubview(GoziRaizer().self)
                    self?.timer.fire()
                    self?.timer = Timer.scheduledTimer(timeInterval: 6, target: self!, selector: #selector(self?.update(up:)), userInfo: nil, repeats: true)
            }else if views.totalCount < 1{
                views.totalTax.textColor = UIColor.black
            }
        }
    }
    @objc func update(up:Timer){
        up.invalidate()
        viewsSet?.totalTax.textColor = UIColor.Color()
    }
    deinit {
        self.notificationToken?.stop()
        print("deinit1")
    }
}
