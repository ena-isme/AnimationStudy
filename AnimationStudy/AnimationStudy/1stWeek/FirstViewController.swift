//
//  ViewController.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/2/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    var testView : UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .systemPink
        return view
    }()
    
    let testView2 : UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        view.backgroundColor = .yellow
        return view
    }()
    
    let testButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 400, width: 200, height: 50))
        button.setTitle("짠!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.titleLabel?.textColor = .brown
        button.layer.backgroundColor = UIColor.black.cgColor
        //        button.addTarget(self, action: #selector(didMoveTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        didMoveTap()
    }
    
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubviews(testView, testButton)
    }
    
    private func didMoveTap() {
        
        
        //animate 기본
        UIView.animate(withDuration: 2.0, animations: { [self] in
            testView.frame.origin.x += 100
            testView.alpha = 0.3
        })
        
        
        //CGAffineTransform
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(translationX: 200, y: 200)
        }
        
        
        //animate Combine
        UIView.animate(withDuration: 2.0) { [self] in
            let scale =  CGAffineTransform(scaleX: 2.0, y: 2.0)
            let rotate = CGAffineTransform(rotationAngle: .pi)
            let translation = CGAffineTransform(translationX: 200, y: 200)
            
            let concatenate = scale.concatenating(rotate).concatenating(translation)
            testView.transform = concatenate
        }
        
        
        //animate 순차처리 - 1
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        } completion: { _ in
            UIView.animate(withDuration: 2.0) { [self] in
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            } completion: { _ in
                UIView.animate(withDuration: 2.0) { [self] in
                    testView.transform = CGAffineTransform(translationX: 200, y: 200)
                }
            }
        }
        
        
        //animate 순차처리 - 2
        UIView.animateKeyframes(withDuration: 3.0, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) { [self] in
                testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) { [self] in
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) { [self] in
                testView.transform = CGAffineTransform(translationX: 200, y: 200)
            }
        }
        
        
        //modifyAnimations
        UIView.animate(withDuration: 1.0) { [self] in
            UIView.modifyAnimations(withRepeatCount: 3.0, autoreverses: true) {
                testView.frame.origin.x += 100
            }
        }
        
        
        //springDuration
        UIView.animate(springDuration: 2.0, bounce: 0.5) {
            testView.center.y += 100
        }
    }
}
