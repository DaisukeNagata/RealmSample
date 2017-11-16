//
//  iphoneSize.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/28.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

//Set the logic, take the UI value, the relative value is tomorrow again.im.bussy.....
struct iphoneSize {
    
    let iphoneSmall : CGFloat = 568.0
    let iphoneMiddle : CGFloat = 667.0
    let iphonePlus : CGFloat = 736.0
    let iphoneX : CGFloat = 812
    let ipadHeight : CGFloat = 1024
    let ipadProHeight : CGFloat = 1366
    
    static var current : iphoneProtocol.Type
    {
        
        let deviceHeight = UIScreen.main.bounds.height
        
        switch deviceHeight {
        case iphoneSize().iphoneSmall:
            return iphone5.self
        case iphoneSize().iphoneMiddle:
            return iphone6.self
        case iphoneSize().iphonePlus:
            return iphone7Plus.self
        case iphoneSize().iphoneX:
            return iphone10.self
        case iphoneSize().ipadHeight:
            return ipad.self
        case iphoneSize().ipadProHeight:
            return ipadPro.self
            
        default:
            break
        }
        return iphone6.self
    }
}
    
    protocol iphoneProtocol
    {
        //Returnの高さ設定
        static var size1 :CGFloat{get}
        //アニメーションの線の設定
        static var size2 : CGFloat{get}
        //横の画面の Return設定
        static var size3 :  CGFloat{get}
        static var size4 : CGFloat{get}
        static var size5 : CGFloat{get}
    }
    
    struct iphone5 : iphoneProtocol
    {
        static var size1: CGFloat{return 255.0}
        static var size2: CGFloat{return UIScreen.main.bounds.height/3.8}
        static var size3: CGFloat{return UIScreen.main.bounds.width/4.3}
        static var size4: CGFloat{return 10}
        static var size5: CGFloat{return 10}
    }
    
    struct iphone6 : iphoneProtocol
    {
        static var size1: CGFloat{return 255.0}
        static var size2: CGFloat{return UIScreen.main.bounds.height/4.5}
        static var size3: CGFloat{return UIScreen.main.bounds.width/4}
        static var size4: CGFloat{return 10}
        static var size5: CGFloat{return 10}
    }
    
    struct iphone7Plus : iphoneProtocol
    {
        static var size1: CGFloat{return 275.0}
        static var size2: CGFloat{return UIScreen.main.bounds.height/5}
        static var size3: CGFloat{return UIScreen.main.bounds.width/3.4}
        static var size4: CGFloat{return UIScreen.main.bounds.height+150}
        static var size5: CGFloat{return 10}
    }
    
    struct iphone10 : iphoneProtocol
    {
        static var size1: CGFloat{return 330.0}
        static var size2: CGFloat{return UIScreen.main.bounds.height/4.7}
        static var size3: CGFloat{return UIScreen.main.bounds.width/3.4}
        static var size4: CGFloat{return UIScreen.main.bounds.height+170}
        static var size5: CGFloat{return 10}
    }
    
    struct ipad : iphoneProtocol
    {
        static var size1: CGFloat{return 310.0}
        static var size2: CGFloat{return UIScreen.main.bounds.height/7}
        static var size3: CGFloat{return UIScreen.main.bounds.width/2.45}
        static var size4: CGFloat{return UIScreen.main.bounds.height+250}
        static var size5: CGFloat{return 10}
    }
    
    struct ipadPro : iphoneProtocol
    {
        static var size1: CGFloat{return 380.0}
        static var size2: CGFloat{return UIScreen.main.bounds.width/2.45}
        static var size3: CGFloat{return UIScreen.main.bounds.width/2.75}
        static var size4: CGFloat{return UIScreen.main.bounds.height+150}
        static var size5: CGFloat{return 10}
    }

