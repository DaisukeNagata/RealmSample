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
            return 255.0
        case 1024:
            return 310.0
        case 1366:
            return 380.0
        default:
            break
        }
        return 310.0
    }
}
