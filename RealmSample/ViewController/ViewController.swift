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
    
    static var vcView = ViewController()
    var viewModel = MagnificationViewModel()
    var setFiledtType = MagnificationView()
    var button  = Button().button
    var buttonTwo = Button().button
    var now = NSDate()
    var totalCount: Double = 0
    
    
    @IBOutlet weak var Navitotal: UIBarButtonItem!
    @IBOutlet weak var tableViewSetting: UITableView!
    @IBOutlet weak var textSet: UITextField!
    @IBOutlet weak var searchSet: UISearchBar!
    @IBOutlet weak var totalTax: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.attachViewSet(vc: self)
        
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
        view.addSubview(ViewController.vcView.setFiledtType.threadLabel)
        view.addSubview(ViewController.vcView.setFiledtType.threadLabelTwo)
        
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
        ViewController.vcView.setFiledtType.threadLabel.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(setFiledtType.view).multipliedBy(0.3)
        }
        ViewController.vcView.setFiledtType.threadLabelTwo.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.height.equalTo(setFiledtType.view).multipliedBy(0.3)
        }
        
        button.addTarget(self, action: #selector(Done(sender:)), for: UIControlEvents.touchUpInside)
        buttonTwo.addTarget(self, action: #selector(DoneTwo(sender:)), for: UIControlEvents.touchUpInside)
        
        let myTap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(sender:)))
        
        setFiledtType.view.addGestureRecognizer(myTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //NavigationController-----------------------------------------
    @IBAction func navigationTotal(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "", message: "商品名と数字を入力してください", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let otherAction = UIAlertAction(title: "OK", style: .default) {
            action in
            alertController.addTextField { ( textFields : UITextField) -> Void in
                if let textFields = alertController.textFields {
                    textFields[0].placeholder = "２行目追加"
                    try!RealmModel.realm.realmTry.write {
                        
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
        
        viewModel.clearSuti()
    }
    func tapGesture(sender: UITapGestureRecognizer){
        if ViewController.vcView.setFiledtType.threadLabel.isEnabled == true{
            ViewController.vcView.setFiledtType.threadLabel.isEnabled = false
            ViewController.vcView.setFiledtType.threadLabelTwo.isEnabled = true
            ViewController.vcView.setFiledtType.threadLabel.backgroundColor = UIColor.blue
            ViewController.vcView.setFiledtType.threadLabelTwo.backgroundColor = UIColor.white
        }else{
            ViewController.vcView.setFiledtType.threadLabel.isEnabled = true
            ViewController.vcView.setFiledtType.threadLabelTwo.isEnabled = false
            ViewController.vcView.setFiledtType.threadLabel.backgroundColor = UIColor.white
            ViewController.vcView.setFiledtType.threadLabelTwo.backgroundColor = UIColor.blue
        }
    }
    
    func Done(sender: UIButton) {
   
        DispatchQueue.main.async { () -> Void in
            if self.textSet.text! != ""{
                
                self.viewModel.clearSuti()
                
                try! RealmModel.realm.realmTry.write {
                    RealmModel.realm.realmTry.create(realmDataSet.self,value: [self.now,self.textSet.text!] as [Any])
                    self.tableViewSetting.reloadData()
                }
            }
        }
        
        textSet.resignFirstResponder()
    }
    
    func DoneTwo(sender: UIButton) {
        DispatchQueue.main.async { () -> Void in
            
            ViewController.vcView.setFiledtType.setFiled.resignFirstResponder()
            
            if ViewController.vcView.setFiledtType.threadLabel.isEnabled == false {
                ViewController.vcView.setFiledtType.threadLabel.text = self.setFiledtType.setFiled.text
            }else if ViewController.vcView.setFiledtType.threadLabelTwo.isEnabled == false {
                ViewController.vcView.setFiledtType.threadLabelTwo.text = self.setFiledtType.setFiled.text
            }
        }
    }
    
    
    func keyShow(note: NSNotification) {

        DispatchQueue.main.async { () -> Void in

            self.button.frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:Size.keyShowWithTwo, height:Size.keyShowHeight)
            UIApplication.shared.windows.last?.addSubview(self.button)
            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            }, completion: { (complete) -> Void in
            })
        }
    }
    func keyShowTwo(note : NSNotification) {
     
        DispatchQueue.main.async { () -> Void in

            self.buttonTwo.frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:Size.keyShowWithTwo, height:Size.keyShowHeight)
            UIApplication.shared.windows.last?.addSubview(self.buttonTwo)
            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            }, completion: { (complete) -> Void in
            })
        }
    }
}
