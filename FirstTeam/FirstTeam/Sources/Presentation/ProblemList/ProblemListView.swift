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
    
    override func setStyle() {
        backgroundColor = UIColor(resource: .white0)
    }
    
    override func setUI() {
        addSubview(tableView)
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
    }
}
