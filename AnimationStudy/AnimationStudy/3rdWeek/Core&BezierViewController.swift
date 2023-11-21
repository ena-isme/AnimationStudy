//
//  Core&BezierViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

import SnapKit

class Core_BezierViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let progressView = ProgressView(frame: .init(origin: .zero, size: .init(width: 100,
                                                                                height: 100)))
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        progressView.progressAnimation(duration: 5, value: 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class ProgressView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(3 * Double.pi / 4)
    private var endPoint = CGFloat(Double.pi / 4)
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    func createCircularPath() {
        self.backgroundColor = .white
        let circularPath = UIBezierPath(arcCenter: .init(x: self.frame.width / 2.0,
                                                         y: self.frame.height / 2.0),
                                        radius: (frame.size.height - 10) / 2.0 ,
                                        startAngle: startPoint,
                                        endAngle: endPoint,
                                        clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 3
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.white.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 3
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
