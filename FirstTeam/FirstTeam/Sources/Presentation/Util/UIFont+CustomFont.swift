//
//  UIFont+CustomFont.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

enum Pretendard {
    // MARK: Title
    case title01
    case title02
    case title03
    case subtitle01
    case subtitle02
    
    // MARK: Body
    case body01
    case body02
    case body03
    case body04
    case body05
    case body06
    
    // MARK: Caption
    case caption01
    case caption02
    
    // MARK: Property
    var size: CGFloat {
        switch self {
        case .title01:
            22
        case .title02:
            20
        case .title03:
            18
        case .subtitle01:
            16
        case .subtitle02:
            16
        case .body01:
            14
        case .body02:
            14
        case .body03:
            14
        case .body04:
            12
        case .body05:
            12
        case .body06:
            12
        case .caption01:
            10
        case .caption02:
            10
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .title01:
            32
        case .title02:
            30
        case .title03:
            24
        case .subtitle01:
            24
        case .subtitle02:
            24
        case .body01:
            20
        case .body02:
            20
        case .body03:
            20
        case .body04:
            20
        case .body05:
            20
        case .body06:
            20
        case .caption01:
            18
        case .caption02:
            18
        }
    }
    
    // TODO: -3%를 어떻게 나타내지
    var spacing: CGFloat {
        switch self {
        case
                .title01,
                .title02,
                .title03,
                .subtitle01,
                .subtitle02,
                .body01,
                .body02,
                .body03,
                .body04,
                .body05,
                .body06:
            -3
        case
                .caption01,
                .caption02:
            0
        }
    }
    
    var name: FirstTeamFontConvertible {
        switch self {
        case .title01, .subtitle01:
            FirstTeam.FirstTeamFontFamily.Pretendard.bold
        case .title02, .title03, .body01, .body04:
            FirstTeam.FirstTeamFontFamily.Pretendard.semiBold
        case .subtitle02, .body03, .body06, .caption02:
            FirstTeam.FirstTeamFontFamily.Pretendard.regular
        case .body02, .body05, .caption01:
            FirstTeam.FirstTeamFontFamily.Pretendard.medium
        }
    }
    
}

extension UIFont {
    /// pretendard 글꼴 제공 함수
    /// info.plist와 글꼴 파일 오류를 탐지하기 위해 강제 언래핑 사용
    static func pretendard(_ font: Pretendard) -> UIFont {
        font.name.font(size: font.size)
    }
}
