//
//  UIView+AddSubviews.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

extension UIView {
    /// UIView 여러 개 인자로 받아서 한 번에 addSubview하는 메소드
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
}
