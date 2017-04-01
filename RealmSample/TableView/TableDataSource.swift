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
        
        for _ in 0...0 {
            totalCount +=  realmSusiki().magnification
            totalTax.text? =  totalCount.description
        }
        return cell
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            viewModel.clearSuti()
            viewModel.deleate()
            
            self.tableViewSetting.reloadData()
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if textSet.text == "" {
            viewModel.deleate()
        }
        
        if ViewController.vcView.setFiledtType.threadLabel.text != "" || ViewController.vcView.setFiledtType.threadLabelTwo.text != "" {
            RealmModel.index.indexSet = indexPath.row
            viewModel.cast(Index: indexPath.row)
        }
    }
    
}
