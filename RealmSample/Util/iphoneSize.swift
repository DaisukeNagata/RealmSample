//
//  iphoneSize.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/28.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit


struct iphoneSize {
    
   
    
    static var current : iphoneProtocol.Type
    {
        
        let deviceHeight = UIScreen.main.bounds.height
        
        switch deviceHeight {
        default:
            break
        }
        return iphone.self
    }
}
    
    protocol iphoneProtocol
    {

        //Set the logic, take the UI value, the relative value is tomorrow again.im.bussy.....
        //アニメーションの線の設定
        static var size2 : CGFloat{get}
        //横の画面の Return設定
        static var size3 :  CGFloat{get}
        static var size4 : CGFloat{get}
    }
    

    
    struct iphone : iphoneProtocol
    {
        //Set the logic, take the UI value, the relative value is tomorrow again.im.bussy.....
        static var size2: CGFloat{return UIScreen.main.bounds.height/4.5}
        static var size3: CGFloat{return UIScreen.main.bounds.width/4}
        static var size4: CGFloat{return 10}
    }


