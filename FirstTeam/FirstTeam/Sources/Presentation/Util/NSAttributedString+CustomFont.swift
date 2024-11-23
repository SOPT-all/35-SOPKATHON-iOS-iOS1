//
//  NSAttributedString+CustomFont.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

extension NSAttributedString {
    /// pretendard 글꼴과 LineHeight, Spacing 제공 함수
    static func pretendard(
        _ text: String,
        font: Pretendard
    ) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = font.spacing
        paragraphStyle.minimumLineHeight = font.lineHeight
        paragraphStyle.maximumLineHeight = font.lineHeight
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.pretendard(font)
        ]
        
        return NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
}
