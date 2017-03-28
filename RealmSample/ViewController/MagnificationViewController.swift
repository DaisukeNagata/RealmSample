//
//  MagnificationViewController.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/10.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit

class MagnificationViewController: UIViewController,UITextFieldDelegate {
    
    var setFiled = TextField()
    let button = Button().button
    var threadLabel = Label().threadLabel
    var threadLabelTwo = Label().threadLabelTwo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンのUI設定
        button.addTarget(self, action: #selector(Done(sender:)), for: UIControlEvents.touchUpInside)
        
        view.isUserInteractionEnabled = true
        setFiled.delegate = self
        
        // ボタンをViewに追加.
        view.addSubview(setFiled)
        view.addSubview(ViewController.vc.setFiledtType.threadLabel)
        view.addSubview(ViewController.vc.setFiledtType.threadLabelTwo)
        
        ViewController.vc.setFiledtType.threadLabel.snp.makeConstraints{(make) in
            make.width.equalTo(self.view).multipliedBy(1)
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.left.equalTo(self.view).offset(0)
            make.height.equalTo(self.view).multipliedBy(0.3)
        }
        ViewController.vc.setFiledtType.threadLabelTwo.snp.makeConstraints{(make) in
            make.width.equalTo(self.view).multipliedBy(1)
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview().multipliedBy(-1)
            make.height.equalTo(self.view).multipliedBy(0.3)
        }
        
        // タップを認識.
        let myTap = UITapGestureRecognizer(target: self, action: #selector(MagnificationViewController.tapGesture(sender:)))
        // Viewに追加.
        self.view.addGestureRecognizer(myTap)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //keyboardWillShowを呼び出す
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    func keyboardWillShow(note : NSNotification) -> Void{
        
        DispatchQueue.main.async { () -> Void in
            //キーボードを閉じるViewを呼び出す。
            self.button.frame = CGRect(x:UIScreen.main.bounds.width-100,y: (UIApplication.shared.windows.last?.frame.size.height)!-iphoneSize.heightSize(), width:106, height:53)
            UIApplication.shared.windows.last?.addSubview(self.button)
            
            //ボタンが押された際のアニメーション
            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey)!as AnyObject).doubleValue), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                self.view.frame = self.view.frame.offsetBy(dx: 0, dy: 0)
            }, completion: { (complete) -> Void in
            })
        }
    }
    
    func Done(sender : UIButton){
        
        DispatchQueue.main.async { () -> Void in
            
            self.setFiled.resignFirstResponder()
            
            if ViewController.vc.setFiledtType.threadLabel.isEnabled == false {
                ViewController.vc.setFiledtType.threadLabel.text = self.setFiled.text
            }else if ViewController.vc.setFiledtType.threadLabelTwo.isEnabled == false {
                ViewController.vc.setFiledtType.threadLabelTwo.text = self.setFiled.text
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}
