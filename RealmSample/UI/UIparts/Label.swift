//
//  Label.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/26.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

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
        threadLabel.backgroundColor = UIColor.white
        threadLabelTwo.backgroundColor = UIColor.white
        threadLabel.textAlignment = .left
        threadLabelTwo.textAlignment = .left

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit5")
    }
}

