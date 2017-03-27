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
    var label = Label.init(threadLabel: UILabel(), threadLabelTwo: UILabel())
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		//ボタンのUI設定
		button.addTarget(self, action: #selector(Done(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.isUserInteractionEnabled = true
		setFiled.delegate = self

		// ボタンをViewに追加.
        self.view.addSubview(setFiled)
		self.view.addSubview(ViewController.vc.setFiledtType.label.threadLabel)
		self.view.addSubview(ViewController.vc.setFiledtType.label.threadLabelTwo)
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
			//設定したbuttonを呼び出す
			let keyBoardWindow = UIApplication.shared.windows.last
			self.button.frame = CGRect(x:UIScreen.main.bounds.width-100,y: (keyBoardWindow?.frame.size.height)!-265, width:106, height:53)
			keyBoardWindow?.addSubview(self.button)
			
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
			
			if  ViewController.vc.setFiledtType.label.threadLabel.isEnabled == false {
				ViewController.vc.setFiledtType.label.threadLabel.text = self.setFiled.text
			}else if ViewController.vc.setFiledtType.label.threadLabelTwo.isEnabled == false {
				ViewController.vc.setFiledtType.label.threadLabelTwo.text = self.setFiled.text
			}
		}
	}
		override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	//タップ検出
	internal func tapGesture(sender: UITapGestureRecognizer){
		if ViewController.vc.setFiledtType.label.threadLabel.isEnabled == true{
			ViewController.vc.setFiledtType.label.threadLabel.isEnabled = false
			ViewController.vc.setFiledtType.label.threadLabelTwo.isEnabled = true
			ViewController.vc.setFiledtType.label.threadLabel.backgroundColor = UIColor.blue
			ViewController.vc.setFiledtType.label.threadLabelTwo.backgroundColor = UIColor.white
		}else{
			ViewController.vc.setFiledtType.label.threadLabel.isEnabled = true
			ViewController.vc.setFiledtType.label.threadLabelTwo.isEnabled = false
			ViewController.vc.setFiledtType.label.threadLabel.backgroundColor = UIColor.white
			ViewController.vc.setFiledtType.label.threadLabelTwo.backgroundColor = UIColor.blue
		}
	}
}
