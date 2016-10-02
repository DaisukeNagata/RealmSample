//
//  ViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/01.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

//realmを使用するためのクラスを作る
class realmDataSet: Object {
	
	dynamic var ID = String()
	dynamic var now = NSDate()
	
}
//realmを使用するためのクラスを作る
var setr = try!Realm()
import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate {
	//realmDataSetクラスを代入
	let realmsset = realmDataSet()
	var usersSet =  setr.objects(realmDataSet.self)
	//Storybordと接続
	@IBOutlet weak var tableViewSetting: UITableView!
	@IBOutlet weak var textSet: UITextField!
	@IBOutlet weak var searchSet: UISearchBar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//viewとtableを接続させる
		tableViewSetting.delegate = self
		tableViewSetting.dataSource = self
		
		//viewとtextSetを紐付ける
		textSet.delegate = self
		
		//texSetの背景色設定
		textSet.backgroundColor = UIColor.lightGray
		
		//
		searchSet.delegate = self
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//要素数をtableviewに表示させる
		return usersSet.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//tableviewのcellをstorybordのidentifiierの一致させる
		let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
		
		//realmobjectsの要素数を取得
		let object = usersSet[indexPath.row]
		
		//文字列を取得
		cell.textLabel?.text = object.ID.description
		
		return cell
	}
	
	//tableを編集モードにするメソッド
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			//realmファイルを開く
			try!setr.write {
				
				//オブジェクト削除
				setr.delete(usersSet[indexPath.row])
				
				//tableViewSettingを再リロード
				self.tableViewSetting.reloadData()
				
			}
		}
	}
	
	//tableに文字列がある場合にタップすると、アクションを起こすメソッド
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		//realmファイルを開く
		try!setr.write {
			
			//indexの値を渡す
			let obj = usersSet[indexPath.row]
			obj.ID = textSet.text!
			
			//tableViewSettingを再リロード
			self.tableViewSetting.reloadData()
		}
	}
	
	//改行ボタンが押された際に呼ばれるデリゲートメソッド
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		//キーボードを下げry
		textField.resignFirstResponder()
		//realmのトランザクションを開く
		try! setr.write {
			//配列に値を渡す
			let object = [textSet.text!]
			//配列に値を入れる
			setr.create(realmDataSet.self,value: object)
			self.tableViewSetting.reloadData()
		}
		return true
	}
	
	//テキストが変更される毎に呼ばれる
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		//realmファイルを開く
		
		
		let results = setr.objects(realmDataSet.self)
			.filter("ID BEGINSWITH %@", searchSet.text!)
			.sorted(byProperty: "ID", ascending: false)
		//indexの値を渡す
		usersSet = results
		
		//tableViewSettingを再リロード
		self.tableViewSetting.reloadData()
		
	}
}

