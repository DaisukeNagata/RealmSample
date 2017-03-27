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
    
    static  var height = CGFloat()
    
    static  func  heightSize()-> CGFloat {
        let heightsize = UIScreen.main.bounds.height
        
        switch heightsize {
        case 568:
            return 255.0
        case 667:
            return 255
        case 767:
            return 255
        case 1048:
            return 310
        case 1336:
            return 380
        default:
            break
        }
        return 310
    }
}
