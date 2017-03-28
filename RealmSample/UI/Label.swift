//
//  Label.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/26.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class Label:UILabel{
    
    // Buttonを生成する.
    var threadLabel = UILabel()
    var threadLabelTwo = UILabel()
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        //ラベルの値を設定
        threadLabel.text = "0"
        threadLabelTwo.text = "0"
        
        // ボタンの背景色を設定.
        threadLabel.backgroundColor = UIColor.orange
        threadLabelTwo.backgroundColor = UIColor.blue
        threadLabel.textAlignment = .left
        threadLabelTwo.textAlignment = .left
        // ボタンの枠を丸くする.
        threadLabelTwo.layer.masksToBounds = true
        // ボタンの枠を丸くする.
        threadLabel.layer.masksToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

