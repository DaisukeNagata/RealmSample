//
//  ViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/01.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

//realmを使用するためのクラスを作る
class realmDataSet: Object {
	
	dynamic var now = NSDate()
	dynamic var ID = String()
	
}

//realmを使用するためのクラスを作る
var realmTry = try!Realm()
import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate {
	
	//realmDataSetクラスを代入
	let realmsset = realmDataSet()
	var usersSet =  realmTry.objects(realmDataSet.self)
	
	//Storybordと接続
	@IBOutlet weak var tableViewSetting: UITableView!
	@IBOutlet weak var textSet: UITextField!
	@IBOutlet weak var searchSet: UISearchBar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//viewとtableを接続させる
		tableViewSetting.delegate = self
		tableViewSetting.dataSource = self
		
		//viewとtextSetを接続させる
		textSet.delegate = self
		
		//texSetの背景色設定
		textSet.backgroundColor = UIColor.lightGray
		
		//検索barのを接続させる
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
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		//objectに代入realmデータをさせる
		let object = usersSet[indexPath.row]
		cell.textLabel?.text = object.ID
		
		return cell
		
	}
	
	//tableを編集モードにするメソッド
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete {
			
			//realmファイルを開く
			try!realmTry.write {
				
				//オブジェクト削除
				realmTry.delete(usersSet[indexPath.row])
				
				//tableViewSettingを再リロード
				self.tableViewSetting.reloadData()
				
			}
		}
	}
	
	//tableに文字列がある場合にタップすると、アクションを起こすメソッド
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if textSet.text == "" {
			
			//realmファイルを開く
			try!realmTry.write {
				
				//オブジェクト削除
				realmTry.delete(usersSet[indexPath.row])
				
				//tableViewSettingを再リロード
				self.tableViewSetting.reloadData()
			}
			
		}else{
			
			//realmファイルを開く
			try!realmTry.write {
				
				//indexの値を渡す
				let obj = usersSet[indexPath.row]
				obj.ID = textSet.text!
				
				//tableViewSettingを再リロード
				self.tableViewSetting.reloadData()
			}
		}
	}
	
	//改行ボタンが押された際に呼ばれるデリゲートメソッド
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		//キーボードを下げry
		textField.resignFirstResponder()
		//realmのトランザクションを開く
		try! realmTry.write {
			//配列に値を渡す
			let now = NSDate()
			let object = [now,textSet.text!] as [Any]
			//配列に値を入れる
			realmTry.create(realmDataSet.self,value: object)
			self.tableViewSetting.reloadData()
		}
		return true
	}
	
	//テキストが変更される毎に呼ばれる
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		//realmファイルを開く
		if  searchBar.text !=  "" {
			let results = realmTry.objects(realmDataSet.self)
				.filter("ID BEGINSWITH %@", searchSet.text!)
				.sorted(byProperty: "ID", ascending: false)
			//indexの値を渡す
			usersSet = results
			
			//tableViewSettingを再リロード
			self.tableViewSetting.reloadData()
			
		}else{
			
			let time = realmTry.objects(realmDataSet.self)
				.sorted(byProperty: "now", ascending: false)
			//indexの値を渡す
			usersSet = time
			//tableViewSettingを再リロード
			self.tableViewSetting.reloadData()
			
		}
	}
}
