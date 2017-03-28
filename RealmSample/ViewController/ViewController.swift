//
//  ViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/01.
//  Copyright © 2016年 永田大祐. All rights reserved.
//


import UIKit
import RealmSwift
import SnapKit

class ViewController: UIViewController,UITextFieldDelegate{
    
    static var vc = ViewController()
    let setFiledtType = MagnificationViewController()
    let button = Button().button
    let buttonTwo = Button().button
    let now = NSDate()
    var totalCount: Double = 0
    
    
    @IBOutlet weak var Navitotal: UIBarButtonItem!
    @IBOutlet weak var tableViewSetting: UITableView!
    @IBOutlet weak var textSet: UITextField!
    @IBOutlet weak var searchSet: UISearchBar!
    @IBOutlet weak var totalTax: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textSet.text = "0"
        totalTax.text? = "0"
        
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        setFiledtType.setFiled.delegate = self
        textSet.delegate = self
        searchSet.delegate = self
        
        textSet.backgroundColor = UIColor.white
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        
        tableViewSetting.reloadData()
        view.addSubview(setFiledtType.setFiled)
        view.addSubview(setFiledtType.view)
        view.addSubview(ViewController.vc.setFiledtType.threadLabel)
        view.addSubview(ViewController.vc.setFiledtType.threadLabelTwo)
        
        setFiledtType.view.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.right.equalTo(searchSet).inset(0)
            make.width.equalTo(searchSet)
            make.height.equalTo(textSet).multipliedBy(4)
        }
        setFiledtType.setFiled.snp.makeConstraints{(make) in
            make.top.equalTo(textSet).offset(3)
            make.right.equalTo(searchSet).inset(0)
            make.width.equalTo(searchSet).multipliedBy(0.5)
            make.height.equalTo(textSet)
        }
        ViewController.vc.setFiledtType.threadLabel.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(setFiledtType.view).multipliedBy(0.3)
        }
        ViewController.vc.setFiledtType.threadLabelTwo.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.height.equalTo(setFiledtType.view).multipliedBy(0.3)
        }
        
        button.addTarget(self, action: #selector(Done(sender:)), for: UIControlEvents.touchUpInside)
        buttonTwo.addTarget(self, action: #selector(DoneTwo(sender:)), for: UIControlEvents.touchUpInside)
        
        // タップを認識.
        let myTap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(sender:)))
        // Viewに追加.
        setFiledtType.view.addGestureRecognizer(myTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyShow(note : NSNotification) -> Void{
        //同時にボタンを押したときなども非同期でスレッド取得、順番を制御する。
        DispatchQueue.main.async { () -> Void in
            //キーボードを閉じるViewを呼び出す。
            self.button.frame = CGRect(x:UIScreen.main.bounds.width-100,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:106, height:53)
            UIApplication.shared.windows.last?.addSubview(self.button)
            
            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            }, completion: { (complete) -> Void in
            })
        }
    }
    func keyShowTwo(note : NSNotification) -> Void{
        //同時にボタンを押したときなども非同期でスレッド取得、順番を制御する。
        DispatchQueue.main.async { () -> Void in
            //キーボードを閉じるViewを呼び出す。
            self.buttonTwo.frame = CGRect(x:UIScreen.main.bounds.width-100,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:106, height:53)
            UIApplication.shared.windows.last?.addSubview(self.buttonTwo)
            
            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            }, completion: { (complete) -> Void in
            })
        }
    }
    
    
    func Done(sender : UIButton){
        //同時にボタンを押したときなども非同期でスレッド取得、順番を制御する。
        DispatchQueue.main.async { () -> Void in
            if self.textSet.text! != ""{
                
                self.clearSuti()
                
                try! RealmModel.realm.realmTry.write {
                    RealmModel.realm.realmTry.create(realmDataSet.self,value: [self.now,self.textSet.text!] as [Any])
                    self.tableViewSetting.reloadData()
                }
            }
        }
        self.setFiledtType.setFiled.resignFirstResponder()
        self.textSet.resignFirstResponder()
    }
    
    func DoneTwo(sender : UIButton){
        
        DispatchQueue.main.async { () -> Void in
            
            self.setFiledtType.setFiled.resignFirstResponder()
            
            if ViewController.vc.setFiledtType.threadLabel.isEnabled == false {
                ViewController.vc.setFiledtType.threadLabel.text = self.setFiledtType.setFiled.text
            }else if ViewController.vc.setFiledtType.threadLabelTwo.isEnabled == false {
                ViewController.vc.setFiledtType.threadLabelTwo.text = ViewController.vc.setFiledtType.setFiled.text
            }
        }
    }
    
    //タップ検出
    internal func tapGesture(sender: UITapGestureRecognizer){
        if ViewController.vc.setFiledtType.threadLabel.isEnabled == true{
            ViewController.vc.setFiledtType.threadLabel.isEnabled = false
            ViewController.vc.setFiledtType.threadLabelTwo.isEnabled = true
            ViewController.vc.setFiledtType.threadLabel.backgroundColor = UIColor.blue
            ViewController.vc.setFiledtType.threadLabelTwo.backgroundColor = UIColor.white
        }else{
            ViewController.vc.setFiledtType.threadLabel.isEnabled = true
            ViewController.vc.setFiledtType.threadLabelTwo.isEnabled = false
            ViewController.vc.setFiledtType.threadLabel.backgroundColor = UIColor.white
            ViewController.vc.setFiledtType.threadLabelTwo.backgroundColor = UIColor.blue
        }
    }
    
    //NavigationController-----------------------------------------
    @IBAction func navigationTotal(_ sender: UIBarButtonItem) {
        
        // アラートビューにテキストフィールドを追加
        let alertController = UIAlertController(title: "", message: "商品名と数字を入力してください", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let otherAction = UIAlertAction(title: "OK", style: .default) {
            action in
            alertController.addTextField { ( textFields : UITextField) -> Void in
                if let textFields = alertController.textFields {
                    textFields[0].placeholder = "２行目追加"
                    try!RealmModel.realm.realmTry.write {
                        
                        //配列に値を渡す ここの処理indexがないと例外が起きるので、空文字の場合にindexを入れる処理。
                        if  self.textSet.text! != "" {
                            //realmfileに値を入れる
                            RealmModel.realm.realmTry.create(realmDataSet.self,value: [self.now,self.textSet.text!, textFields[0].text!] as [Any])
                            self.tableViewSetting.reloadData()
                        }
                    }
                    self.textSet.resignFirstResponder()
                    self.setFiledtType.setFiled.resignFirstResponder()
                }
            }
        }
        alertController.addAction(otherAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        
        self.clearSuti()
    }
    
    //数値クリア
    func clearSuti(){
        totalTax.text? = "0"
        totalCount = 0
    }
    
    func deleate(){
        try!RealmModel.realm.realmTry.write {
            RealmModel.realm.realmTry.delete(realmSusikiString().magni())
        }
    }
    
    func wari(Index:Int){
        if ViewController.vc.setFiledtType.threadLabelTwo.text != "0" && textSet.text! != "" {
            
            try!RealmModel.realm.realmTry.write {
                
                RealmModel.realm.usersSet[Index].ID =  ((Double( RealmModel.realm.usersSet[Index].ID))! / Suusiki().magnificationTwo).description
                
                self.clearSuti()
                
                self.totalTax.text? = totalCount.description
                self.tableViewSetting.reloadData()
            }
        }
    }
    
    func cast(Index:Int){
        //数値設定
        self.clearSuti()
        
        if ViewController.vc.setFiledtType.threadLabel.text != "0" && textSet.text! != "" {
            
            try!RealmModel.realm.realmTry.write {
                RealmModel.realm.usersSet[Index].ID = (Suusiki().magnification*realmSusiki().magnification).description
            }
        }
        if textSet.text! != ""  &&  ViewController.vc.setFiledtType.threadLabel.text == "0" && ViewController.vc.setFiledtType.threadLabelTwo.text == "0" {
            try!RealmModel.realm.realmTry.write {
                RealmModel.realm.usersSet[Index].ID = textSet.text!
            }
        }
        wari(Index:Index)
        totalTax.text? = totalCount.description
        self.tableViewSetting.reloadData()
    }
}
