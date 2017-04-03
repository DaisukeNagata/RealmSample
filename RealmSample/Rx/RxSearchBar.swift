//
//  RxSearchBar.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/03.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

struct RxSearchBar {
    
    static var rxSearchBar = RxSearchBar()
    var dis = DisposeBag()
    
    func rxSearchBar(search:UISearchBar,text:String,table:UITableView){
            search
            .rx.text.orEmpty
            .subscribe(onNext: { [unowned search] query in
                if  search.text !=  "" {
                    //indexの値を渡す
                    RealmModel.realm.usersSet = RealmModel.realm.realmTry.objects(realmDataSet.self)
                        .filter("Message BEGINSWITH %@",  search.text!)
                        .sorted(byKeyPath: "Message", ascending: false)
                    
                }else if  search.text! == ""{
                    
                    RealmModel.realm.usersSet = RealmModel.realm.realmTry.objects(realmDataSet.self)
                        .sorted(byKeyPath: "now", ascending: false)
                }
                table.reloadData() 
            })
            .addDisposableTo(dis)
    }
}
