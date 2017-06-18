//
//  TableDelegate.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/27.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RealmModel.realm.usersSet.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        print(String.init(format: "willDisplay", indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        print(String.init(format: "didEndDisplaying", indexPath.row))
    }

}
