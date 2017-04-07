//
//  Color.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/08.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    class func Color() -> UIColor {
        let ranx1 = arc4random_uniform(255)
        let rany2 = arc4random_uniform(255)
        let ranx3 = arc4random_uniform(255)
        return UIColor.rgb(r: Int(ranx1), g: Int(rany2), b: Int(ranx3), alpha: 1.0)
    }
}
