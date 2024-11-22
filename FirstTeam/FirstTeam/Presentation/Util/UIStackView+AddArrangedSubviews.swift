//
//  UIStackView+AddArrangedSubviews.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

extension UIStackView {
    /// UIView 여러 개 인자로 받아서 한 번에 addArrangedSubview하는 메소드
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}
