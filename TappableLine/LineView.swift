//
//  LineView.swift
//  TappableLine
//
//  Created by Taro on 2019/03/13.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class LineView:CAShapeLayer{
    private var circleView1:CircleView
    private var circleView2:CircleView
    
    private var linePath = UIBezierPath()
    private let lineViewWidth:CGFloat = 10.0
    
    required init(circleView1: CircleView, circleView2: CircleView) {
        self.circleView1 = circleView1
        self.circleView2 = circleView2
        super.init()
        self.createPath()
        self.drawLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func createPath(){
        self.linePath.removeAllPoints()
        
        if self.circleView1.center.x == self.circleView2.center.x{
            let originY:CGFloat = min(self.circleView1.center.y, self.circleView2.center.y)
            self.linePath = UIBezierPath(rect: CGRect(x: self.circleView1.center.x - self.lineViewWidth / 2,
                                                      y: originY,
                                                      width: self.lineViewWidth,
                                                      height: CGFloat(fabsf(Float(self.circleView1.center.y - self.circleView2.center.y)))))
            
        }else if self.circleView1.center.y == self.circleView2.center.y{
            let originX:CGFloat = min(self.circleView1.center.x, self.circleView2.center.x)
            self.linePath = UIBezierPath(rect: CGRect(x: originX,
                                                      y: self.circleView1.center.y - self.lineViewWidth / 2,
                                                      width: CGFloat(fabsf(Float(self.circleView1.center.x - self.circleView2.center.x))),
                                                      height: self.lineViewWidth))
            
        }else{
            let m:CGFloat = (self.circleView1.center.y - self.circleView2.center.y) / (self.circleView1.center.x - self.circleView2.center.x)
            let m_p:CGFloat = (-1)/m
            
            
            let delta:CGFloat = sqrt(pow(self.lineViewWidth / 2, 2.0) / (pow(m_p, 2.0) + 1.0))
            
            self.linePath.move(to: CGPoint(x: self.circleView1.center.x + delta,
                                           y: m_p * (self.circleView1.center.x + delta) + self.circleView1.center.y - m_p * self.circleView1.center.x))
            self.linePath.addLine(to: CGPoint(x: self.circleView2.center.x + delta,
                                              y: m_p * (self.circleView2.center.x + delta) + self.circleView2.center.y - m_p * self.circleView2.center.x))
            self.linePath.addLine(to: CGPoint(x: self.circleView2.center.x - delta,
                                              y: m_p * (self.circleView2.center.x - delta) + self.circleView2.center.y - m_p * self.circleView2.center.x))
            self.linePath.addLine(to: CGPoint(x: self.circleView1.center.x - delta,
                                              y: m_p * (self.circleView1.center.x - delta) + self.circleView1.center.y - m_p * self.circleView1.center.x))
            self.linePath.close()
        }
    }
    
    public func drawLine(){
        self.fillColor = UIColor.black.cgColor
        self.path = self.linePath.cgPath
    }
}
