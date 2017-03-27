//
//  proTest.swift
//  marutiSured
//
//  Created by 永田大祐 on 2016/10/09.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import Foundation
import RealmSwift

//realmを使用するクラス
class realmDataSet: Object {
	
	dynamic var now = NSDate()
	dynamic var ID = String()
	dynamic var Message = String()
	//プロパティを増やす場合は、schemaVersionをUpさせて追加する。プロパティ名を変更する際は/*https://realm.io/docs/swift/latest/#migrations*/の詳細を参照する。
	dynamic var Message2 = String()
	
}

//realmを使用するためのクラスを作る
var realmTry = try!Realm()

//realmDataSetクラスを代入
let realmsset = realmDataSet()
var usersSet =  realmTry.objects(realmDataSet.self)

//indexを取得
var indexSet : Int = 0
var totalCount: Double = 0

//Stringを設定するprotocol
protocol setTextString {
	
	var magnificationString:String{get set}
	//メソッド設定
	func magnificationSetString()->String
}

//Doubleを設定するprotocol
protocol setText {
	
	var magnification:Double{get set}
	//メソッド設定
	func magnificationSet()->Double
}

//Labelを管理するクラス
class Suusiki:setText {
	
    internal var magnification: Double = (Double(ViewController.vc.setFiledtType.threadLabel.text!))!
	internal var magnificationTwo: Double =  (Double(ViewController.vc.setFiledtType.threadLabelTwo.text!))!
	internal func magnificationSet() -> Double {
		
		return  magnification
	}
		internal func magnificationSetTwo() -> Double {
			
			return  magnificationTwo

	}
}
//realmを使用するためのクラスを作る（String）
class realmSusikiString:setTextString {
	
	internal var magnificati =  usersSet[indexSet]
	internal var magnificationString =  usersSet[indexSet].ID
	
	internal func magnificationSetString() -> String {
	
		return  magnificationString
		
	}
		
	internal func magni() -> realmDataSet {
		
		return  magnificati
		
	}
}

//realmを使用するためのクラスを作る.（Double）
class realmSusiki:setText {
	
	internal var magnification: Double =  (Double(usersSet[indexSet].ID))!

	internal func magnificationSet() -> Double {
	
		return  magnification
		
	}
	
}
