//
//  DudejiViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

class DudejiViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = DudejiView()
    }
}

class DudejiView: UIView {
    override func draw(_ rect: CGRect) {
        drawRoundSquare()
    }
    
    func drawRoundSquare() {
        let path = UIBezierPath(roundedRect: CGRect(x: bounds.midX-50,
                                                    y: bounds.midY-50,
                                                    width: 100,
                                                    height: 200),
                                byRoundingCorners: [UIRectCorner.bottomRight,
                                                    UIRectCorner.topLeft],
                                cornerRadii: CGSize(width: 20,
                                                    height: 20))
        UIColor.systemRed.setFill()
        UIColor.systemYellow.setStroke()
        path.lineWidth = 10
        path.stroke()
        path.fill()
    }
}
