//
//  RxTextFiled.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/02.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

struct RxTextFiled{
    
    static var rxTextFiled = RxTextFiled()
    var dis = DisposeBag()
    
    func RxrextFiled(textSet:UITextField,textFFiled:UITextField,setFiled:UITextField,threadLabel:UILabel,threadLabelTwo:UILabel)  {
        
        Observable.combineLatest(textSet.rx.text.orEmpty,textFFiled.rx.text.orEmpty) {
            textValue1 , textValue2-> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0)
            }
            .map { $0.description }
            .bindTo(threadLabel.rx.text)
            .disposed(by: dis)
        
        Observable.combineLatest(setFiled.rx.text.orEmpty,textFFiled.rx.text.orEmpty) {
            textValue1 , textValue2-> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0)
            }
            .map { $0.description }
            .bindTo( threadLabelTwo.rx.text)
            .disposed(by: dis)
    }
}
