//
//  ViewController.swift
//  TappableLine
//
//  Created by Taro on 2019/03/13.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var circle1 = CircleView(baseView: self,
                                          frame: CGRect(x: 50,
                                                        y: 200,
                                                        width: 50,
                                                        height: 50))
    private lazy var circle2 = CircleView(baseView: self,
                                          frame: CGRect(x: self.view.frame.width - 100,
                                                        y: 500,
                                                        width: 50,
                                                        height: 50))
    
    private lazy var line:LineView = LineView(circleView1: self.circle1, circleView2: self.circle2)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }

    private func setView(){
        self.view.backgroundColor = .orange
        self.view.addSubview(self.circle1)
        self.view.addSubview(self.circle2)
        self.view.layer.insertSublayer(line, at: 0)
    }
    
    public func circleMoved(){
        self.line.createPath()
        self.line.drawLine()
    }

}

