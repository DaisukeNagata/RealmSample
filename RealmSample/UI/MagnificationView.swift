//
//  MagnificationView.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/29.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class MagnificationView: UIView {
    
    var setField = TextField()
    let button = Button().button
    var threadLabel = Label().threadLabel
    var threadLabelTwo = Label().threadLabelTwo
    var searchBar: SearchBar()
    var view: UIView?
    
    override init (frame: CGRect){ super.init(frame: frame) }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    deinit {
        print("deinit2")
    }
}

