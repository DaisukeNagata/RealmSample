//
//  SearchBar.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/27.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UISearchBarDelegate {
    //searchBar Data-------------------------------------------------
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if  searchBar.text !=  "" {
            //左辺値の頭文字を検索
            let results = realmTry.objects(realmDataSet.self)
                .filter("ID BEGINSWITH %@", searchSet.text!)
                .sorted(byProperty: "Message", ascending: false)
            //indexの値を渡す
            usersSet = results
            
            self.tableViewSetting.reloadData()
            
        }else{
            
            let time = realmTry.objects(realmDataSet.self)
                .sorted(byProperty: "now", ascending: false)
            
            usersSet = time
            
            self.tableViewSetting.reloadData()
        }
    }
}
