//
//  DeviceOrientation.swift
//  RealmSample
//
//  Created by nagatadaisuke on 2017/07/16.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

struct DeviceOrientation {
    
    static func deviceOrientation(uvc:UIViewController,table:UITableView,setFiledtType:MagnificationView,textSet:UITextField,size1:CGFloat){
        let deviceOrientation: UIDeviceOrientation!  = UIDevice.current.orientation
        
        let uvc = uvc as? ViewController
        
        if UIDeviceOrientationIsLandscape(deviceOrientation) {
            
            let frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-size1+40, width:Size.keyShowWithTwo, height:Size.keyShowHeight)
            RxNotification.rxNotification.Rxnotification(button: uvc ,frame: frame)
            
        } else {
            let frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-size1+40, width:Size.keyShowWithTwo, height:Size.keyShowHeight)
            RxNotification.rxNotification.Rxnotification(button: uvc , frame: frame)
            
        }
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            if UIDeviceOrientationIsLandscape(deviceOrientation) {
                
                
                setFiledtType.searchBar.snp.makeConstraints{(make) in
                    make.top.equalTo(textSet.snp.top).multipliedBy(0.45)
                    make.centerX.equalToSuperview()
                    make.width.equalTo((uvc?.view)!)
                    make.height.equalTo(textSet).multipliedBy(1.7)
                }
                
                table.frame = CGRect(x:-50,y:200,width:UIScreen.main.bounds.height*2,height:UIScreen.main.bounds.width)
                
            } else if UIDeviceOrientationIsPortrait(deviceOrientation){
                setFiledtType.searchBar.snp.makeConstraints{(make) in
                    make.top.equalTo(textSet.snp.top).multipliedBy(0.65)
                    make.centerX.equalToSuperview()
                    make.width.equalTo((uvc?.view)!)
                    make.height.equalTo(textSet).multipliedBy(1.7)
                }
                
                let frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-size1, width:Size.keyShowWithTwo, height:Size.keyShowHeight)
                RxNotification.rxNotification.Rxnotification(button: uvc, frame: frame)
            }
        }
    }
    
    static func deviceOrientationSecound(table:UITableView){
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            let deviceOrientation: UIDeviceOrientation!  = UIDevice.current.orientation
            
            if UIDeviceOrientationIsLandscape(deviceOrientation) {
                
                table.frame = CGRect(x:-50,y:0,width:UIScreen.main.bounds.height*2,height:UIScreen.main.bounds.width)
                
            } else if UIDeviceOrientationIsPortrait(deviceOrientation){
                
                
                table.frame = CGRect(x:0,y:64,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                
            }
        }
    }
}
