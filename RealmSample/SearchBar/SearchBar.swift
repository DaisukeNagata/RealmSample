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
            
            //indexの値を渡す
            usersSet = realmTry.objects(realmDataSet.self)
                .filter("ID BEGINSWITH %@", searchSet.text!)
                .sorted(byProperty: "Message", ascending: false)
        }else{
            
            usersSet = realmTry.objects(realmDataSet.self)
                .sorted(byProperty: "now", ascending: false)
        }
        self.tableViewSetting.reloadData()
    }
}
