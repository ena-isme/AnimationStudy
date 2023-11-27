////
////  StarRainViewController.swift
////  AnimationStudy
////
////  Created by 신지원 on 11/27/23.
////
//
//import UIKit
//
//class StarRainViewController: UIViewController {
//
//    
//    override func loadView() {
//        super.loadView()
//        let progressView = ProgressView(frame: .init(origin: .zero, size: .init(width: 100,
//                                                                                height: 100)))
//        self.view.addSubview(progressView)
//        progressView.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//            $0.width.height.equalTo(100)
//        }
//        progressView.progressAnimation(duration: 5, value: 1)
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}
//
//
//class starRainView: UIView {
//    private var progressLayer = CAShapeLayer()
//    private var startPoint = CGFloat(3 * Double.pi / 4)
//    private var endPoint = CGFloat(Double.pi / 4)
//    
//    override func draw(_ rect: CGRect) {
//        createRainPath()
//    }
//    
//    func createRainPath() {
//        self.backgroundColor = .white
//        let linePath = UIBezierPath()
//        
//        UIColor.white.setStroke()
//        linePath.move(to: CGPoint(x: 100, y: 100))
//        linePath.addLine(to: CGPoint(x: 300, y: 300))
//        linePath.stroke()
//        
//        layer.addSublayer(linePath)
//        
//        progressLayer.path = circularPath.cgPath
//        progressLayer.fillColor = UIColor.clear.cgColor
//        progressLayer.lineCap = .round
//        progressLayer.lineWidth = 3
//        progressLayer.strokeEnd = 0
//        progressLayer.strokeColor = UIColor.red.cgColor
//        layer.addSublayer(progressLayer)
//    }
//    
//    func progressAnimation(duration: TimeInterval, value: Double) {
//        // created circularProgressAnimation with keyPath
//        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        // set the end time
//        circularProgressAnimation.duration = duration
//        circularProgressAnimation.toValue = value
//        circularProgressAnimation.fillMode = .forwards
//        circularProgressAnimation.isRemovedOnCompletion = false
//        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
//    }
//}
