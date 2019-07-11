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
    
    var viewModel: MagnificationViewModel?
    var setFiledtType: MagnificationView?
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
        
        viewModel = MagnificationViewModel()
        setFiledtType = MagnificationView()
        guard let sType = setFiledtType else { return }
        viewModel?.attachViewSet(vc: self)
        textField.text = "0"
        textSet.text = "0"
        
        tableViewSetting.dataSource = self
        tableViewSetting.delegate = self
        tableViewSetting.prefetchDataSource = self
        sType.searchBar.delegate = self
        view.addSubview(tableViewSetting)

        tableViewSetting.register(MagnificationCell.self, forCellReuseIdentifier: "Cell")
        tableViewSetting.reloadData()

        view.addSubview(sType.searchBar)
        view.addSubview(sType.setField)
        view.addSubview(sType.view)
        view.addSubview(sType.threadLabel)
        view.addSubview(sType.threadLabelTwo)

        //RX------------------------------------------------------------------------------------------------------------------------------
        setFiledtType?.button.rx.tap.bind { _ in RxButton.rxButton.Rxbutton(sender: sType.button, textSet: self.textSet, viewModel: self.viewModel, views: self, now: self.now) }.disposed(by: dis)
        
        RxTextFiled.rxTextFiled.RxrextFiled(textSet: textSet,textFFiled: textField,setFiled:sType.setField,threadLabel: sType.threadLabel,threadLabelTwo: sType.threadLabelTwo)
        
        RxSearchBar.rxSearchBar.rxSearchBar(search: sType.searchBar, text: sType.searchBar.text!, table: tableViewSetting)
        //RX------------------------------------------------------------------------------------------------------------------------------
        if UIInterfaceOrientation.portrait.isPortrait == false{
            
            sType.searchBar.snp.makeConstraints{(make) in
                make.top.equalTo(textSet.snp.top).multipliedBy(0.45)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.view)
                make.height.equalTo(textSet).multipliedBy(1.7)
            }
            
        }else{
            sType.searchBar.snp.makeConstraints{(make) in
                make.top.equalTo(textSet.snp.top).multipliedBy(0.65)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.view)
                make.height.equalTo(textSet).multipliedBy(1.7)
            }
            
        }
        sType.view.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.right.equalTo(sType.searchBar).inset(0)
            make.width.equalTo(sType.searchBar)
            make.height.equalTo(textSet).multipliedBy(4)
        }
        sType.setField.snp.makeConstraints{(make) in
            make.top.equalTo(textSet).offset(3)
            make.right.equalTo(sType.searchBar).inset(0)
            make.width.equalTo(sType.searchBar).multipliedBy(0.5)
            make.height.equalTo(textSet)
        }
        sType.threadLabel.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(sType.view).multipliedBy(0.3)
        }
        sType.threadLabelTwo.snp.makeConstraints{(make) in
            make.top.equalTo(textSet.snp.bottom)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.height.equalTo(sType.view).multipliedBy(0.3)
        }

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onOrientationChange), name: UIDevice.orientationDidChangeNotification, object: nil)

        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {

            if let split = self.splitViewController {
                split.delegate = self
                split.preferredDisplayMode = .allVisible
                tableViewSetting.frame = CGRect(x:0,y:240,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
               DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:sType,textSet:textSet,size1:UIScreen.main.bounds.size.height/2.3)

            }
            
        } else if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {

            if let split = self.splitViewController {
                split.delegate = self
                split.preferredDisplayMode = .allVisible
                split.maximumPrimaryColumnWidth = 800
                split.preferredPrimaryColumnWidthFraction = 0.5
                tableViewSetting.frame = CGRect(x:0,y:259,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                                    DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:sType,textSet:textSet,size1:UIScreen.main.bounds.size.height/2.9)
                    
            }
        }
    }

    @objc func onOrientationChange(notification: NSNotification) {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        self.tableViewSetting.reloadData()
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        let keyboardInfo = userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        guard let keyboard = keyboardInfo, let sType = setFiledtType else { return }
        DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:sType,textSet:textSet,size1:(keyboard.cgRectValue.height) + 40)
    }

    @objc private func keyboardWillhide(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        let keyboardInfo = userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        guard let keyboard = keyboardInfo, let sType = setFiledtType else { return }
        DeviceOrientation.deviceOrientation(uvc:self,table:tableViewSetting,setFiledtType:sType,textSet:textSet,size1:(keyboard.cgRectValue.height) + 40)
    }

    //NavigationController-----------------------------------------
    @IBAction func navigationTotal(_ sender: UIBarButtonItem) { AlertView().alert(view: self,now:now,tx:self.textSet,table:tableViewSetting) }
    
    @IBAction func clearAction(_ sender: UIBarButtonItem) { viewModel?.clearSuti() }
}
