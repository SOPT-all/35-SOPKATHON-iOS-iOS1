//
//  CustomTextField.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

final class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setTextField(placeholder: placeholder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextField(placeholder: String = "") {
        backgroundColor = UIColor(resource: .gray01)
        font = .pretendard(.body02)
        textColor = UIColor(resource: .gray11)
        setPlaceholder(text: placeholder, color: UIColor(resource: .gray05), font: .pretendard(.body02))
        addPadding(left: 20, right:20)
        layer.cornerRadius = 8
    }
    
    func setPlaceholder(text: String, color: UIColor, font: UIFont) {
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: color,
                .font: font
            ]
        )
    }
    
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}
