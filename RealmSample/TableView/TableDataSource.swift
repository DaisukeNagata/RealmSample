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
            RealmSetting.realmSetting.RealmNOtification(views: self)
            totalCount +=  realmSusiki().magnificationSet(Index: indexPath.row)
            totalTax?.text? =  totalCount.description
            //HowTo Usage
            mbText.text = report_memory()
        }
        cell.kakauLabel.numberOfLines = 2
        mbText.text = cell.kakauLabel.text
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
            self.tableViewSetting.reloadData()
            RealmModel.realm.bool = true
            RealmSetting().RealmDeleate(indexPath:indexPath)
        } else if textSet.text == "1" {
            viewModel.clearSuti()
            RealmModel.realm.bool = true
            RealmSetting().RealmAdd(text: textSet.text!, Index: indexPath, now: now)
        } else if textSet.text != "" {
            viewModel.clearSuti()
            viewModel.cast(Index: indexPath.row)
        }
        self.tableViewSetting.reloadData()
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            
            print(String.init(format: "prefetchRowsAt", indexPath.row))
            
        }
    }
    // Used when something method
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            
            print(String.init(format: "cancelPrefetchingForRowsAt", indexPath.row))
            
        }
    }
}

extension ViewController22: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MagnificationCell
        cell.cellMethod(indexPath: indexPath)
        
        for _ in 0...0{
            //RealmNotification
            RealmSetting.realmSetting.RealmNOtification22(views: self)

        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RealmSetting().RealmDeleate(indexPath:indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        self.tableViewSetting.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableViewSetting.reloadData()
    }
}

extension ViewController22: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            
            print(String.init(format: "prefetchRowsAt", indexPath.row))
            
        }
    }
    // Used when something method
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            
            print(String.init(format: "cancelPrefetchingForRowsAt", indexPath.row))
            
        }
    }
}

