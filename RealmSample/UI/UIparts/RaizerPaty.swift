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
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            
            self.view?.frame = CGRect(x:UIScreen.main.bounds.width-100,y:UIApplication.shared.statusBarFrame.size.height+125,width:UIScreen.main.bounds.width/3,height:50)
            
        } else if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            
            self.view?.frame = CGRect(x:280,y:UIApplication.shared.statusBarFrame.size.height+125,width:UIScreen.main.bounds.width/3,height:50)
            
        }

        guard let Path = Bundle.main.path(forResource: "MyParticle", ofType: "sks") else {
            return
        }
        self.view?.backgroundColor = UIColor.clear
        raizerPaty = NSKeyedUnarchiver.unarchiveObject(withFile: Path) as! SKEmitterNode
        raizerPaty.position = CGPoint(x: self.frame.maxX, y: self.frame.maxX)
        self.addChild(raizerPaty)
    }
    deinit {
        self.removeAllChildren()
        print("deinit3")
    }
}


