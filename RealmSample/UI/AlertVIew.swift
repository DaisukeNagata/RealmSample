//
//  AlertView.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/22.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit


class AlertView {
    
    func alert(view:UIViewController,now:NSDate,tx:UITextField,table:UITableView){
        
        let alertController = UIAlertController(title: "", message: "商品名と数字を入力してください", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let otherAction = UIAlertAction(title: "OK", style: .default) {
            action in
            alertController.addTextField { ( textFields : UITextField) -> Void in
                guard alertController.textFields?[0].text == "" else {
          
                    RealmSetting().RealmCreate(now:now,text:tx.text! ,text2: (alertController.textFields?[0].text)!)
                    table.reloadData()
                    
                    return
                }
            }
        }
        
        alertController.textFields?[0].keyboardType = .default
        alertController.addAction(otherAction)
        view.present(alertController, animated: true, completion: nil)
        
    }
    
}
