//
//  MagnificationViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/10.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit
//モデルリングの準備
class MagnificationViewController: UIViewController,UITextFieldDelegate {
    
    var setFiled = TextField()
    let button = Button().button
    var threadLabel = Label().threadLabel
    var threadLabelTwo = Label().threadLabelTwo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.isUserInteractionEnabled = true
        
               
    }
    
}
