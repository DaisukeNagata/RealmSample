//
//  Label.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/26.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

class Label{
    
    // Buttonを生成する.
    var threadLabel = UILabel()
    var threadLabelTwo = UILabel()

    init(threadLabel:UILabel,threadLabelTwo:UILabel) {
        self.threadLabel = threadLabel
        self.threadLabelTwo = threadLabelTwo
        
        //ラベルの値を設定
        threadLabel.text = "0"
        threadLabelTwo.text = "0"

        // ボタンのサイズ.
        let bWidth: CGFloat = UIScreen.main.bounds.width/2
        let bHeight: CGFloat = 30

        // ボタンの設置座標とサイズを設定する.
        threadLabel.frame = CGRect(x: 0, y: 0, width: bWidth, height: bHeight)
        threadLabelTwo.frame = CGRect(x: bWidth, y:0, width: bWidth, height: bHeight)
        // ボタンの背景色を設定.
        threadLabel.backgroundColor = UIColor.white
        threadLabelTwo.backgroundColor = UIColor.white
        // ボタンの枠を丸くする.
        threadLabelTwo.layer.masksToBounds = true
        // ボタンの枠を丸くする.
        threadLabel.layer.masksToBounds = true

    }
}
