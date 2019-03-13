//
//  CircleView.swift
//  TappableLine
//
//  Created by Taro on 2019/03/13.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class CircleView:UIView{
    private var baseView:ViewController
    private let circleLayer = CAShapeLayer()
    private var circlePath = UIBezierPath()
    
    private var previousPosition = CGPoint.zero
    
    required init(baseView:ViewController, frame: CGRect) {
        self.baseView = baseView
        super.init(frame: frame)
        self.drawLayer()
        self.setRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawLayer(){
        self.circlePath.removeAllPoints()
        self.circleLayer.removeFromSuperlayer()
        
        self.circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2,
                                                          y: self.frame.height / 2),
                                       radius: self.frame.width / 2,
                                       startAngle: 0,
                                       endAngle: CGFloat(Double.pi) * 2,
                                       clockwise: true)
        
        self.circleLayer.fillColor = UIColor.black.cgColor
        self.circleLayer.path = self.circlePath.cgPath
        self.layer.addSublayer(self.circleLayer)
    }
    
    private func setRecognizer(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panHandler))
        self.addGestureRecognizer(pan)
    }
    
    @objc func panHandler(recognizer: UIPanGestureRecognizer){
        if recognizer.state == .began{
            self.previousPosition = recognizer.location(in: self.superview)
        }else if recognizer.state == .changed{
            let currentPosition = recognizer.location(in: self.superview)
            let deltaX = currentPosition.x - self.previousPosition.x
            let deltaY = currentPosition.y - self.previousPosition.y
            
            let newPosition = CGPoint(x: self.frame.origin.x + deltaX,
                                      y: self.frame.origin.y + deltaY)
            
            self.frame.origin = newPosition
            self.previousPosition = currentPosition
            
            self.baseView.circleMoved()
        }
    }
}
