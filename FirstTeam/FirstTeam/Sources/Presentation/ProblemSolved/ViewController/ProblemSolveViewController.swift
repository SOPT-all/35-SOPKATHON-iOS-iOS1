//
//  ProblemSolveViewController.swift
//  FirstTeam
//
//  Created by 김예지 on 11/24/24.
//

import UIKit

import SnapKit
import Then

final class ProblemSolveViewController: BaseViewController {
    private let problemSolveView = ProblemSolveView(isAfterThreeDays: false)
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setTarget() {
        problemSolveView.greenButton.addTarget(self, action: #selector(greenButtonDidTap), for: .touchUpInside)
        problemSolveView.grayButton.addTarget(self, action: #selector(grayButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func greenButtonDidTap() {
        let beforeSelectViewController = BeforeSelectViewController()
        self.navigationController?.pushViewController(beforeSelectViewController, animated: true)
    }
    
    @objc
    private func grayButtonDidTap() {
        let problemSolveCompleteViewController = ProblemSolveCompleteViewController()
        self.navigationController?.pushViewController(problemSolveCompleteViewController, animated: true)
    }
    
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        view.addSubviews(problemSolveView)
    }

    override func setLayout() {
        problemSolveView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
