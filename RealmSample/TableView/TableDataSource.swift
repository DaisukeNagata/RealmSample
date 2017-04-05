//
//  TableDataSource.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/27.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MagnificationCell
        cell.cellMethod(indexPath: indexPath)
        
            totalCount +=  realmSusiki().magnificationSet(Index: indexPath.row)
            totalTax.text? =  totalCount.description
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RealmSetting().RealmDeleate(indexPath:indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if textSet.text == "" || textSet.text == "0" {
            RealmSetting().RealmDeleate(indexPath:indexPath)
        } else if textSet.text != "" {
            viewModel.cast(Index: indexPath.row)
        }
        
        self.tableViewSetting.reloadData()
        
    }
}
