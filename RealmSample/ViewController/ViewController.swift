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

class ViewController: UIViewController,UISearchBarDelegate{

    var viewModel = MagnificationViewModel()
    var setFiledtType = MagnificationView()
    var button  = MagnificationView().button
    var textField = UITextField()
    var now = NSDate()
    var totalCount: Double = 0
    var dis = DisposeBag()
    var Navitotal: UIBarButtonItem!
    @IBOutlet weak var tableViewSetting: UITableView!
    @IBOutlet weak var textSet: UITextField!
    @IBOutlet weak var totalTax: UILabel!
    @IBOutlet weak var mbText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        viewModel.attachViewSet(vc: self)
        textField.text = "0"
        textSet.text = "0"
        totalTax.text? = "0"
        
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        setFiledtType.searchBar.delegate = self

        
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        tableViewSetting.reloadData()
        
        view.addSubview(setFiledtType.searchBar)
        view.addSubview(setFiledtType.setFiled)
        view.addSubview(setFiledtType.view)
        view.addSubview(setFiledtType.threadLabel)
        view.addSubview(setFiledtType.threadLabelTwo)
        
        //RX------------------------------------------------------------------------------
        button.rx.tap.bind { _ in RxButton.rxButton.Rxbutton(sender: self.button, textSet: self.textSet, viewModel: self.viewModel ,views: self, now: self.now) }.addDisposableTo(dis)
        //キーボードframe
        let frame = CGRect(x:UIScreen.main.bounds.width-Size.keyShowWith,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:Size.keyShowWithTwo, height:Size.keyShowHeight)
        RxNotification.rxNotification.Rxnotification(button: self, frame: frame)
        RxTextFiled.rxTextFiled.RxrextFiled(textSet: textSet,textFFiled: textField,setFiled:setFiledtType.setFiled,threadLabel:setFiledtType.threadLabel,threadLabelTwo:setFiledtType.threadLabelTwo)
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
        setFiledtType.threadLabel.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(setFiledtType.view).multipliedBy(0.3)
        }
        setFiledtType.threadLabelTwo.snp.makeConstraints{(make) in
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
        
        AlertView().alert(view: self,now:now,tx:self.textSet,table:tableViewSetting)
        
    }
    
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        
        viewModel.clearSuti()
        
    }
    
}
