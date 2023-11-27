//
//  Transform3DViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/27/23.
//

import UIKit

class Transform3DViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewToTransform = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        viewToTransform.backgroundColor = .red
        self.view.addSubview(viewToTransform)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500 // 원근감을 위한 값 설정
        transform = CATransform3DRotate(transform, CGFloat(45 * Double.pi / 180), 0, 0, 1)
        viewToTransform.layer.transform = transform
    }
}
