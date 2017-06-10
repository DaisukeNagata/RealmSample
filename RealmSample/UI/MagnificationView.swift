//
//  MagnificationView.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/03/29.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit

class MagnificationView: UIView{
    
    var setField = TextField()
    let button = Button().button
    var threadLabel = Label().threadLabel
    var threadLabelTwo = Label().threadLabelTwo
    var searchBar = SearchBar()
    var view = UIView()
    
    override init (frame:CGRect){
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit2")
    }
}

