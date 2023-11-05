//
//  FirstAssignmentToastView.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/5/23.
//

import UIKit

import SnapKit
import Then

class FirstAssignmentToastView : UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private var toastImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "toast")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hierarchy()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func hierarchy() {
        self.addSubviews(toastImageView)
    }
    
    private func layout() {
        toastImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(250)
        }
    }
}
