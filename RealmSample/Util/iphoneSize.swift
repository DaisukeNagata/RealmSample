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
    
    static  func  heightSize()-> CGFloat {
        let heightsize = UIScreen.main.bounds.height
        
        switch heightsize {
        case 568:
            return 255.0
        case 667:
            return 255.0
        case 736:
            return 275.0
        case 1024:
            return 310.0
        case 1366:
            return 380.0
        default:
            break
        }
        return 310.0
    }
    static  func  heightSize2()-> CGFloat {
        let heightsize = UIScreen.main.bounds.height
        
        switch heightsize {
        case 568:
            return UIScreen.main.bounds.height/3.8
        case 667:
            return UIScreen.main.bounds.height/4.5
        case 736:
            return UIScreen.main.bounds.height/5
        case 1024:
            return UIScreen.main.bounds.height/7
        case 1366:
            return UIScreen.main.bounds.height/8.5
        default:
            break
        }
        return UIScreen.main.bounds.height/5
    }
    static  func  heightSizeLandscape()-> CGFloat {
        let heightsize = UIScreen.main.bounds.height

        switch heightsize {
        case 320:
            return UIScreen.main.bounds.width/4.3
        case 375:
            return UIScreen.main.bounds.width/4
        case 414:
            return UIScreen.main.bounds.width/3.4
        case 768:
            return UIScreen.main.bounds.width/2.75
        case 1024:
            return UIScreen.main.bounds.width/2.45
        default:
            break
        }
        return UIScreen.main.bounds.width/2.75
    }

    static  func  heightSizePro()-> CGFloat {
        let heightsize = UIScreen.main.bounds.height
        
        switch heightsize {
        case 768:
            return UIScreen.main.bounds.height+150
        case 1024:
            return UIScreen.main.bounds.height+250
        default:
            break
        }
        return UIScreen.main.bounds.height+150
    }

}
