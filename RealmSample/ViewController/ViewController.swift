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
import RxSwift
import RxCocoa

class ViewController: UIViewController,UITextFieldDelegate,UISearchBarDelegate{
    
    static var vcView = ViewController()
    var viewModel = MagnificationViewModel()
    var setFiledtType = MagnificationView()
    var button  = MagnificationView().button
    var buttonTwo = MagnificationView().button
    var textFFiled = UITextField()
    var now = NSDate()
    var totalCount: Double = 0
    var dis = DisposeBag()
    
    @IBOutlet weak var Navitotal: UIBarButtonItem!
    @IBOutlet weak var tableViewSetting: UITableView!
    @IBOutlet weak var textSet: UITextField!
    @IBOutlet weak var totalTax: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.attachViewSet(vc: self)
        textFFiled.text = "0"
        textSet.text = "0"
        totalTax.text? = "0"
        
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        setFiledtType.searchBar.delegate = self
        setFiledtType.setFiled.delegate = self
        textSet.delegate = self
        
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        tableViewSetting.reloadData()
        
        view.addSubview(setFiledtType.searchBar)
        view.addSubview(setFiledtType.setFiled)
        view.addSubview(setFiledtType.view)
        view.addSubview(ViewController.vcView.setFiledtType.threadLabel)
        view.addSubview(ViewController.vcView.setFiledtType.threadLabelTwo)
        
        //RX------------------------------------------------------------------------------
        button.rx.tap.bindNext { _ in RxButton.rxButton.Rxbutton(sender: self.button, textSet: self.textSet, viewModel: self.viewModel, tableViewSetting: self.tableViewSetting, now: self.now) }.addDisposableTo(dis)
        //キーボードframe
        let frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:Size.keyShowWithTwo, height:Size.keyShowHeight)
        RxNotification.rxNotification.Rxnotification(button: self, frame: frame)
        RxTextFiled.rxTextFiled.RxrextFiled(textSet: textSet,textFFiled: textFFiled,setFiled:setFiledtType.setFiled,threadLabel:ViewController.vcView.setFiledtType.threadLabel,threadLabelTwo:ViewController.vcView.setFiledtType.threadLabelTwo)
        RxSearchBar.rxSearchBar.rxSearchBar(search: setFiledtType.searchBar, text: setFiledtType.searchBar.text!, table: tableViewSetting)
        //RX------------------------------------------------------------------------------
        
        setFiledtType.searchBar.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.top).multipliedBy(0.65)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view)
            make.height.equalTo(textSet).multipliedBy(1.7)
        }
        setFiledtType.view.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.right.equalTo(setFiledtType.searchBar).inset(0)
            make.width.equalTo(setFiledtType.searchBar)
            make.height.equalTo(textSet).multipliedBy(4)
        }
        setFiledtType.setFiled.snp.makeConstraints{(make) in
            make.top.equalTo(textSet).offset(3)
            make.right.equalTo(setFiledtType.searchBar).inset(0)
            make.width.equalTo(setFiledtType.searchBar).multipliedBy(0.5)
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
                    
                    RealmSetting().RealmCreate(now: self.now,text: self.textSet.text! ,text2: textFields[0].text!)
                    self.tableViewSetting.reloadData()
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
}
