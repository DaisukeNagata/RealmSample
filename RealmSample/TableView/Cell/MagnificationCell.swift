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
		//商品名を表示するラベル
		titleLabel = UILabel(frame: CGRect(x:20, y:0, width:UIScreen.main.bounds.width, height:40))
		titleLabel.text = "";
		titleLabel.font = UIFont.systemFont(ofSize: 22)
		
		self.addSubview(titleLabel)
		//数量を表示するラベル
		cellLabel = UILabel(frame: CGRect(x:UIScreen.main.bounds.width/2, y:0, width:UIScreen.main.bounds.width, height:40));
		cellLabel.text = "";
		cellLabel.font = UIFont.systemFont(ofSize: 22)
		
		self.addSubview(cellLabel)
		
	}
	
	required init(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)!
	}
    func cellMethod(indexPath:IndexPath){
        
        let object = RealmModel.realm.usersSet[indexPath.row]
        //Resultsの値を代入
        titleLabel.text  = object.Message
        cellLabel.text = object.ID
      
    }
}
