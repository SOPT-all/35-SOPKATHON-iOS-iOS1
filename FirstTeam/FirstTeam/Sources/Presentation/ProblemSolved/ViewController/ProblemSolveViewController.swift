//
//  ProblemSolveViewController.swift
//  FirstTeam
//
//  Created by 김예지 on 11/24/24.
//

import UIKit

class ProblemSolveViewController: BaseViewController {
    private let problemSolveVIew = ProblemSolveView(isAfterThreeDays: false)
    private let problemSolveCompleteView = ProblemSolveCompleteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
