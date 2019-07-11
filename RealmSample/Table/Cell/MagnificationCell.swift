//
//  cellTableView.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/10.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit

class MagnificationCell: UITableViewCell {

    var titleLabel = UILabel()
    var cellLabel = UILabel()
    var kakauLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRect(x:Size.labelWidthX, y:0, width:UIScreen.main.bounds.width, height:Size.labelHeight))
        titleLabel.text = ""
        titleLabel.font = UIFont.systemFont(ofSize: Size.labelFont)
        
        self.addSubview(titleLabel)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            cellLabel = UILabel(frame: CGRect(x:UIScreen.main.bounds.width/2, y:0, width:UIScreen.main.bounds.width, height:Size.labelHeight));
        }else{
            cellLabel = UILabel(frame: CGRect(x:UIScreen.main.bounds.width/4, y:0, width:UIScreen.main.bounds.width, height:Size.labelHeight));
        }
        cellLabel.font = UIFont.systemFont(ofSize: Size.labelFont)
        
        self.addSubview(cellLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override var frame: CGRect {
        
        get {
            return super.frame
        }
        set (newFrame) {

            var frame = newFrame

            frame.origin.x += CGFloat(10)
            frame.size.width -= 2*CGFloat(10)
            super.frame = frame
            super.contentView.backgroundColor = UIColor.blue
            
            }
    }
    
    func cellMethod(indexPath:IndexPath){
        
        titleLabel.text  = RealmModel.realm.usersSet[indexPath.row].Message
        cellLabel.text = RealmModel.realm.usersSet[indexPath.row].ID
        
    }
}
