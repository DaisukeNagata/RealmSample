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
        
        // パーティクルファイルのパスを指定
        guard let testParticlePath = Bundle.main.path(forResource: "MyParticle", ofType: "sks") else {
            return
        }
        //SE
        self.view?.frame = CGRect(x:223,y:150,width:300,height:44)
        self.view?.backgroundColor = UIColor.clear

        raizerPaty = NSKeyedUnarchiver.unarchiveObject(withFile: testParticlePath) as! SKEmitterNode
        raizerPaty.position = CGPoint(x: self.frame.maxX, y: self.frame.maxX)
        self.addChild(raizerPaty)
        
    }
}

