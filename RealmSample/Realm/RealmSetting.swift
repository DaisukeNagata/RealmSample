//
//  RealmSetting.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/03.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit
import RealmSwift

class RealmSetting{
    
    static var realmSetting = RealmSetting()
    var notificationToken: NotificationToken?
    var timer = Timer()
    var viewsSet:ViewController?
    var viewsSet22:ViewController22?
    
    func RealmNOtification(views:ViewController){
        RealmThread(views:views)
    }
    
    func RealmNOtification22(views:ViewController22){
        RealmThread22(views:views)
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
        ViewController22.ddd.tableViewSetting.reloadData()
        notificationToken = RealmModel.realm.usersSet.observe { [weak self] change in
            print(views.totalCount)
            if views.totalCount > 1000.0{
                self?.timer.fire()
                self?.timer = Timer.scheduledTimer(timeInterval: 6, target: self!, selector: #selector(self?.update(up:)), userInfo: nil, repeats: true)
            }else if views.totalCount < 1{
                views.totalTax.textColor = UIColor.black
            }
        }
    }
    @objc func update(up:Timer){
        up.invalidate()
        viewsSet?.view.addSubview(GoziRaizer().self)
        viewsSet?.totalTax.textColor = UIColor.Color()
    }
    deinit {
        self.notificationToken?.invalidate()
        
        print("deinit1")
    }
    
    //RealmNotification
    private func RealmThread22(views:ViewController22){
        viewsSet22 = views
        notificationToken = RealmModel.realm.usersSet.observe { [weak self] change in
            
            self?.timer.fire()
            self?.timer = Timer.scheduledTimer(timeInterval: 1, target: self!, selector: #selector(self?.update2(up:)), userInfo: nil, repeats: true)
            
        }
    }
    @objc func update2(up:Timer){
        up.invalidate()
        guard RealmModel.realm.bool == true else {return}
        viewsSet22?.tableViewSetting.reloadData()
        RealmModel.realm.bool = false
    }
}
