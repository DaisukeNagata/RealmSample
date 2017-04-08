//
//  RaizerPaty.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/08.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import SpriteKit
import UIKit

class RaizerPaty:SKScene{
    
    var raizerPaty = SKEmitterNode()
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.clear
        self.scaleMode = .resizeFill
        RaizerPaty()
    }
    
    func RaizerPaty() {
        self.view?.frame = CGRect(x:UIScreen.main.bounds.width-100,y:iphoneSize.heightSize2(),width:UIScreen.main.bounds.width/3,height:50)
        guard let Path = Bundle.main.path(forResource: "MyParticle", ofType: "sks") else {
            return
        }
        self.view?.backgroundColor = UIColor.clear
        raizerPaty = NSKeyedUnarchiver.unarchiveObject(withFile: Path) as! SKEmitterNode
        raizerPaty.position = CGPoint(x: self.frame.maxX, y: self.frame.maxX)
        self.addChild(raizerPaty)
    }
}

