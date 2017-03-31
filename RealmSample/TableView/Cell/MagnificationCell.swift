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
    
	override init(style: UITableViewCellStyle, reuseIdentifier: String!)
	{
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		titleLabel = UILabel(frame: CGRect(x:Size.labelWidthX, y:0, width:UIScreen.main.bounds.width, height:Size.labelHeight))
		titleLabel.text = "";
		titleLabel.font = UIFont.systemFont(ofSize: Size.labelFont)
		
		self.addSubview(titleLabel)

		cellLabel = UILabel(frame: CGRect(x:UIScreen.main.bounds.width/2, y:0, width:UIScreen.main.bounds.width, height:Size.labelHeight));
		cellLabel.text = "";
		cellLabel.font = UIFont.systemFont(ofSize: Size.labelFont)
		
		self.addSubview(cellLabel)
		
	}
	
	required init(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)!
	}
    func cellMethod(indexPath:IndexPath){
        
        let object = RealmModel.realm.usersSet[indexPath.row]

        titleLabel.text  = object.Message
        cellLabel.text = object.ID
      
    }
}
