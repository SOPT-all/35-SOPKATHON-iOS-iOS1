//
//  ProblemListView.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

import SnapKit
import Then

final class ProblemListView: BaseView {
    let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    private let emptyLabel = UILabel().then {
        $0.text = "아직 해결된 고민이 없삼...\n고민을 입력해 주삼!"
        $0.font = .pretendard(.title01)
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.isHidden = true
    }
    
    override func setStyle() {
        backgroundColor = UIColor(resource: .white0)
    }
    
    override func setUI() {
        addSubviews(tableView, emptyLabel)
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(336)
            $0.centerX.equalToSuperview()
        }
    }
}
