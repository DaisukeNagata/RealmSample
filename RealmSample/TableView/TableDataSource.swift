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
            totalTax.text? = totalCount.description
        }
        return cell
        
    }
    
    //tableを編集モードにするメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.clearSuti()
            
            try!realmTry.write {
                
                realmTry.delete(usersSet[indexPath.row])
                
                self.tableViewSetting.reloadData()
            }
        }
    }
    //tableに文字列がある場合にタップすると、アクションを起こすメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if textSet.text == "" {
            deleate()
        }
        
        if ViewController.vc.setFiledtType.label.threadLabel.text != "" || ViewController.vc.setFiledtType.label.threadLabelTwo.text != "" {
            cast( Index: indexPath.row)
        }
    }
    
    //textFiled Data-------------------------------------------------
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //キーボードを閉じるためのメソッドを呼び出す
        NotificationCenter.default.addObserver(self, selector: #selector(keyShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
}
