//
//  File.swift
//  AnimationStudy
//
//  Created by 신지원 on 11/3/23.
//

import UIKit

extension UIView {
    func addSubviews (_ views: UIView...){
        views.forEach { self.addSubview($0) }
    }
}
