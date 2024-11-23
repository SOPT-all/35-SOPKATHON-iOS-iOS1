//
//  ProblemListEmptyView.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

import SnapKit
import Then

final class ProblemListEmptyView: BaseView {
    private let titleLabel = UILabel().then {
        $0.text = "아직 해결된 고민이 없삼...\n고민을 입력해 주삼!"
        $0.font = .pretendard(.title01)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    override func setStyle() {
        backgroundColor = UIColor(resource: .white0)
    }
    
    override func setUI() {
        addSubview(titleLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(336)
            $0.centerX.equalToSuperview()
        }
    }
}
