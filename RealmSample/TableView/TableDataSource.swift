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
        
        for _ in 0...0{
            //RealmNotification
            RealmSetting.realmSetting.RealmNOtification(views: self, Gozi: GoziRaizer().self)
            
            totalCount +=  realmSusiki().magnificationSet(Index: indexPath.row)
            totalTax?.text? =  totalCount.description
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.clearSuti()
            RealmSetting().RealmDeleate(indexPath:indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        self.tableViewSetting.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if textSet.text == "" || textSet.text == "0" {
            viewModel.clearSuti()
            RealmSetting().RealmDeleate(indexPath:indexPath)
        } else if textSet.text != "" {
            viewModel.clearSuti()
            RealmSetting().RealmAdd(text: textSet.text!, Index: indexPath, now: now)
        }
        self.tableViewSetting.reloadData()
    }
}
