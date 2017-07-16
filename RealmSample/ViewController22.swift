//
//  ViewController22.swift
//  RealmSample
//
//  Created by nagatadaisuke on 2017/07/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class ViewController22: UIViewController {

    static var ddd = ViewController22()
    var now = NSDate()
    var tableViewSetting = ViewController().tableViewSetting
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetting.frame = view.frame
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        tableViewSetting.prefetchDataSource = self
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        tableViewSetting.frame = CGRect(x:0,y:64,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
        view.addSubview(tableViewSetting)
        tableViewSetting.reloadData()

    }

    @IBAction func update(_ sender: UIBarButtonItem) {
        
        tableViewSetting.reloadData()
    }
}
