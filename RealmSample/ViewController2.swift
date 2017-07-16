//
//  ViewController2.swift
//  RealmSample
//
//  Created by nagatadaisuke on 2017/07/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit



class ViewController2: UIViewController,vcSegue {
    var ddd : ViewController2?
    var totalCount: Double = 0
    @IBOutlet weak var tableViewSetting: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        tableViewSetting.prefetchDataSource = self
        
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        tableViewSetting.reloadData()
        
        ddd = viewSegue(vc: self) as? ViewController2
    }

    func viewSegue(vc: UIViewController) -> UIViewController {
        return self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
