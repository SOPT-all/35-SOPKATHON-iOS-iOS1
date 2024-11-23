//
//  CheckProblemViewController.swift
//  FirstTeam
//
//  Created by 김예지 on 11/23/24.
//

import UIKit

import Then
import SnapKit

class CheckProblemViewController: BaseViewController {
    // MARK: - UI Components
    private let checkProblemView = CheckProblemView()
    private let completeProblemView = CompleteProblemView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - View Lifecycle
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        view.addSubviews(completeProblemView)
    }

    override func setLayout() {
        completeProblemView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
