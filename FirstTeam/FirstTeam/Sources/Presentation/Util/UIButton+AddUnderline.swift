//
//  UIButton+AddUnderline.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

import UIKit

extension UIButton {
    
    func addUnderline() {
        let attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
}
