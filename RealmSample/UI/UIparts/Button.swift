//
//  Button.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/26.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

class Button: UIButton {
    
    //キーボードのButton設定
    let button = UIButton(type: UIButton.ButtonType.custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        //キーボードを閉じる生成。
        button.setTitle("Return", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit5")
    }
}
