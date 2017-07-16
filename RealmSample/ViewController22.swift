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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(onOrientationChange(notification:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    func onOrientationChange(notification: NSNotification){
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            let deviceOrientation: UIDeviceOrientation!  = UIDevice.current.orientation
            
            if UIDeviceOrientationIsLandscape(deviceOrientation) {
                
                tableViewSetting.frame = CGRect(x:-50,y:0,width:UIScreen.main.bounds.height*2,height:UIScreen.main.bounds.width)
                
            } else if UIDeviceOrientationIsPortrait(deviceOrientation){
                
                
                tableViewSetting.frame = CGRect(x:0,y:64,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                
            }
        }
    }
}
