//
//  CircleViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

class CircleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = CircleView()
    }
}

class CircleView: UIView {
    override func draw(_ rect: CGRect) {
        drawCircle()
    }
    
    func drawCircle() {
        let path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - 50,
                                               y: bounds.midY - 50,
                                               width: 100,
                                               height: 100))
        UIColor.systemRed.setFill()
        UIColor.systemYellow.setStroke()
        path.lineWidth = 10
        path.stroke()
        path.fill()
    }
}
