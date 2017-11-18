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

class ViewController: UIViewController,UISearchBarDelegate,UISplitViewControllerDelegate{
    
    var viewModel = MagnificationViewModel()
    var setFiledtType = MagnificationView()
    var button  = MagnificationView().button
    var textField = UITextField()
    var now = NSDate()
    var totalCount: Double = 0
    var dis = DisposeBag()
    var Navitotal: UIBarButtonItem!
    var tableViewSetting = UITableView()
    @IBOutlet weak var textSet: UITextField!
    @IBOutlet weak var totalTax: UILabel!
    @IBOutlet weak var mbText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.attachViewSet(vc: self)
        textField.text = "0"
        textSet.text = "0"
        
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        tableViewSetting.prefetchDataSource = self
        setFiledtType.searchBar.delegate = self
        view.addSubview(tableViewSetting)
        
        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        tableViewSetting.reloadData()
        
        view.addSubview(setFiledtType.searchBar)
        view.addSubview(setFiledtType.setField)
        view.addSubview(setFiledtType.view)
        view.addSubview(setFiledtType.threadLabel)
        view.addSubview(setFiledtType.threadLabelTwo)
        
        //RX------------------------------------------------------------------------------------------------------------------------------
        button.rx.tap.bind { _ in RxButton.rxButton.Rxbutton(sender: self.button, textSet: self.textSet, viewModel: self.viewModel, views: self, now: self.now) }.disposed(by: dis)
        
        RxTextFiled.rxTextFiled.RxrextFiled(textSet: textSet,textFFiled: textField,setFiled:setFiledtType.setField,threadLabel:setFiledtType.threadLabel,threadLabelTwo:setFiledtType.threadLabelTwo)
        
        RxSearchBar.rxSearchBar.rxSearchBar(search: setFiledtType.searchBar, text: setFiledtType.searchBar.text!, table: tableViewSetting)
        //RX------------------------------------------------------------------------------------------------------------------------------
        if UIInterfaceOrientation.portrait.isPortrait == false{
            
            setFiledtType.searchBar.snp.makeConstraints{(make) in
                make.top.equalTo(textSet.snp.top).multipliedBy(0.45)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.view)
                make.height.equalTo(textSet).multipliedBy(1.7)
            }
            
        }else{
            setFiledtType.searchBar.snp.makeConstraints{(make) in
                make.top.equalTo(textSet.snp.top).multipliedBy(0.65)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.view)
                make.height.equalTo(textSet).multipliedBy(1.7)
            }
            
        }
        setFiledtType.view.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.right.equalTo(setFiledtType.searchBar).inset(0)
            make.width.equalTo(setFiledtType.searchBar)
            make.height.equalTo(textSet).multipliedBy(4)
        }
        setFiledtType.setField.snp.makeConstraints{(make) in
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillHide, object: nil)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            
            if let split = self.splitViewController {
                split.delegate = self
                split.preferredDisplayMode = .allVisible
                tableViewSetting.frame = CGRect(x:0,y:220,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:setFiledtType,textSet:textSet,size1:UIScreen.main.bounds.size.height/2.3)
            }
            
        } else if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            
            if let split = self.splitViewController {
                split.delegate = self
                split.preferredDisplayMode = .allVisible
                split.maximumPrimaryColumnWidth = 800
                split.preferredPrimaryColumnWidthFraction = 0.5
                tableViewSetting.frame = CGRect(x:0,y:259,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:setFiledtType,textSet:textSet,size1:UIScreen.main.bounds.size.height/2.9)
            }
            
        }
    }
    
    func onOrientationChange(notification: NSNotification){
        let userInfo = notification.userInfo as? [String: Any]
        let keyboardInfo = userInfo![UIKeyboardFrameBeginUserInfoKey] as? NSValue
        
        guard keyboardInfo?.cgRectValue.height != nil else {
            return
        }
        DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:setFiledtType,textSet:textSet,size1:(keyboardInfo?.cgRectValue.height)!+40)
        NotificationCenter.default.removeObserver(self,
                                                  name: .UIApplicationDidBecomeActive,
                                                  object: nil)
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        let keyboardInfo = userInfo![UIKeyboardFrameBeginUserInfoKey] as? NSValue
        DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:setFiledtType,textSet:textSet,size1:(keyboardInfo?.cgRectValue.height)!+40)
    }
    @objc private func keyboardWillhide(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        let keyboardInfo = userInfo![UIKeyboardFrameBeginUserInfoKey] as? NSValue
        DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:setFiledtType,textSet:textSet,size1:(keyboardInfo?.cgRectValue.height)!+40)
    }
    
    //NavigationController-----------------------------------------
    @IBAction func navigationTotal(_ sender: UIBarButtonItem) {
        
        AlertView().alert(view: self,now:now,tx:self.textSet,table:tableViewSetting)
        
    }
    
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        
        viewModel.clearSuti()
        
    }
}
