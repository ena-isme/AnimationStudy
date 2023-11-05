//
//  FirstAssignmentViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/5/23.
//

import UIKit
import SnapKit

class FirstAssignmentViewController: UIViewController {
    
    private let brrrButton : UIButton = {
        let button = UIButton()
        button.setTitle("부르르 나와라 얍!", for: .normal)
        button.titleLabel?.font = UIFont(name: "Korail-Round-Gothic-Light", size: 20)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(brrrBtnTap), for: .touchUpInside)
        return button
    }()
    
    private let toastButton : UIButton = {
        let button = UIButton()
        button.setTitle("토스트메시지 나와라 얍!", for: .normal)
        button.titleLabel?.font = UIFont(name: "Korail-Round-Gothic-Light", size: 20)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(toastBtnTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(toastButton)
        view.addSubview(brrrButton)
        
        brrrButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview().offset(-55)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
        
        toastButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview().offset(55)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(260)
        }
    }
    
    @objc
    private func brrrBtnTap() {
        brrrButton.shakeButton()
    }
    
    @objc
    private func toastBtnTap() {
        showToast()
    }
}

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 20,
                       options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
}

extension FirstAssignmentViewController {
    func showToast() {
        let toastView = FirstAssignmentToastView()
        toastView.layer.cornerRadius = 6
        
        view.addSubview(toastView)
        
        toastView.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(250)
        }
        
        UIView.animate(withDuration: 1.0, delay: 2.0, options: .curveEaseIn) {
            toastView.alpha = 0.0
        } completion: { _ in
            toastView.removeFromSuperview()
        }
    }
}
