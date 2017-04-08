//
//  GoziRaizer.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/08.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GoziRaizer: UIView {
    
    var line = UIBezierPath()
    var lineLayer = CAShapeLayer()
    var animation = CABasicAnimation(keyPath: "strokeEnd")
    var view = UIView()
    var skview = SKView()
    var timer = Timer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.frame = bounds
        
        self.line.move(to: CGPoint(x: UIScreen.main.bounds.width/2 , y: 44))
        self.lineLayer.fillColor = UIColor.clear.cgColor
        self.line.addLine(to: CGPoint(x: UIScreen.main.bounds.width-50 , y:190.0))
        self.addSubview(labelSet(label: view))
        
        timer.fire()
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.update(up:)), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func labelSet(label:UIView)->UIView{
        label.alpha = 1
        setShapeLayer()
        return label
    }
    func setShapeLayer(){
        _ =  shapeLayer(shape: lineLayer)
        _ =  animationDraw(animation: animation)
        self.layer.addSublayer(shapeLayer(shape: lineLayer))
        shapeLayer(shape: lineLayer).add(animation, forKey: nil)
    }
    func shapeLayer(shape:CAShapeLayer)->CAShapeLayer{
        shape.lineWidth = 4
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillRule = kCAFillRuleEvenOdd
        shape.path = line.cgPath
        self.layer.addSublayer(shape)
        return shape
    }
    func animationDraw(animation:CABasicAnimation)->CABasicAnimation{
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = true
        return animation
    }
    func update(up: Timer){
        up.invalidate()
        let scene = RaizerPaty(size: skview.bounds.size)
        skview.presentScene(scene)
        self.view.addSubview(skview)
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.update2(up:)), userInfo: nil, repeats: true)
    }
    func update2(up: Timer){
        up.invalidate()
        self.removeFromSuperview()
    }
    
    deinit {
        print("deinit3")
    }
}
