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
    let button = MagnificationViewController().button
    let now = NSDate()
    
    @IBOutlet weak var Navitotal: UIBarButtonItem!
    @IBOutlet weak var tableViewSetting: UITableView!
    @IBOutlet weak var textSet: UITextField!
    @IBOutlet weak var searchSet: UISearchBar!
    @IBOutlet weak var totalTax: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textSet.text = "0"
        totalTax.text? = "0"
        totalCount = 0
        
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        textSet.delegate = self
        searchSet.delegate = self
        
        textSet.backgroundColor = UIColor.white
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        
        tableViewSetting.reloadData()
        view.addSubview(setFiledtType.setFiled)
        view.addSubview(setFiledtType.view)

        setFiledtType.view.snp.makeConstraints{(make) in
            make.top.equalTo(textSet).offset(3)
            make.right.equalTo(searchSet).inset(0)
            make.width.equalTo(searchSet).multipliedBy(0.5)
            make.height.equalTo(textSet)
        }
        setFiledtType.setFiled.snp.makeConstraints{(make) in
            make.height.equalTo(setFiledtType.view)
            make.right.equalTo(self.view).inset(0)
            make.width.equalTo( setFiledtType.view)
            make.centerY.equalToSuperview().multipliedBy(0.5)
        }
        button.addTarget(self, action: #selector(Done(sender:)), for: UIControlEvents.touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyShow(note : NSNotification) -> Void{
        //同時にボタンを押したときなども非同期でスレッド取得、順番を制御する。
        DispatchQueue.main.async { () -> Void in
            
            //キーボードを閉じるViewを呼び出す。
            let window = UIApplication.shared.windows.last
            self.button.frame = CGRect(x:UIScreen.main.bounds.width-100,y: (window?.frame.size.height)!-265, width:106, height:53)
            window?.addSubview(self.button)

            
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
                
                try! realmTry.write {
                    realmTry.create(realmDataSet.self,value: [self.now,self.textSet.text!] as [Any])
                    self.tableViewSetting.reloadData()
                }
            }
        }
        self.textSet.resignFirstResponder()
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
                    try!realmTry.write {
                        
                        //配列に値を渡す ここの処理indexがないと例外が起きるので、空文字の場合にindexを入れる処理。
                        if  self.textSet.text! != "" {
                            //realmfileに値を入れる
                            realmTry.create(realmDataSet.self,value: [self.now,self.textSet.text!, textFields[0].text!] as [Any])
                            self.tableViewSetting.reloadData()
                        }
                    }
                    self.textSet.resignFirstResponder()
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
        try!realmTry.write {
            realmTry.delete(realmSusikiString().magni())
        }
    }

    func wari(Index:Int){
        if ViewController.vc.setFiledtType.threadLabelTwo.text != "0" && textSet.text! != "" {
            
            try!realmTry.write {
                
                usersSet[Index].ID =  ((Double( usersSet[Index].ID))! / Suusiki().magnificationTwo).description
                
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
            
            try!realmTry.write {
                usersSet[Index].ID = (Suusiki().magnification*realmSusiki().magnification).description
            }
        }
        if textSet.text! != ""  &&  ViewController.vc.setFiledtType.threadLabel.text == "0" &&  ViewController.vc.setFiledtType.threadLabelTwo.text == "0" {
            try!realmTry.write {
                usersSet[Index].ID = textSet.text!
            }
        }
        wari(Index:Index)
        totalTax.text? = totalCount.description
        self.tableViewSetting.reloadData()
    }
}
