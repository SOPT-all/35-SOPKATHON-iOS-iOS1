//
//  ProblemSolveCompleteViewController.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

import SnapKit
import Then

final class ProblemSolveCompleteViewController: BaseViewController {
    private let problemSolveCompleteView = ProblemSolveCompleteView()
    
    // MARK: - View Lifecycle
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        view.addSubviews(problemSolveCompleteView)
    }

    override func setLayout() {
        problemSolveCompleteView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
