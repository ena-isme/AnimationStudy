//
//  SquareViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

class SquareViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = SquareView() //아래 class 선언한 뷰 추가하기
    }
}

class SquareView: UIView {
    override func draw(_ rect: CGRect) {
        drawSqaure()
    }
    
    func drawSqaure() {
        let path = UIBezierPath(rect: CGRect(x: self.bounds.midX - 50,
                                             y: self.bounds.midY - 50,
                                             width: 100,
                                             height: 100))
        UIColor.systemRed.setFill()
        UIColor.systemYellow.setStroke()
        path.lineWidth = 10
        path.stroke()
        path.fill()
    }
}
