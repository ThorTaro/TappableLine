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
        self.setRecognizer()
    }

    private func setView(){
        self.view.backgroundColor = .orange
        self.view.layer.insertSublayer(line, at: 0)
        self.view.addSubview(self.circle1)
        self.view.addSubview(self.circle2)
    }
    
    public func circleMoved(){
        self.line.createPath()
        self.line.drawLine()
    }
    
    private func setRecognizer(){
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        self.view.addGestureRecognizer(longpress)
    }
    
    @objc func longPressHandler(recognizer:UILongPressGestureRecognizer){
        if recognizer.state == .began, self.line.path!.contains(recognizer.location(in: self.view)){
            print("Line tapped")
            self.toggleColor()
        }
    }
    
    private func toggleColor(){
        if self.view.backgroundColor == .orange{
            self.view.backgroundColor = .yellow
        }else{
            self.view.backgroundColor = .orange
        }
    }

}

