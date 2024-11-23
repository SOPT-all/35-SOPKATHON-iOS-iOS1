//
//  CheckProblemViewController.swift
//  FirstTeam
//
//  Created by 김예지 on 11/23/24.
//

import UIKit

import Then
import SnapKit

final class CheckProblemViewController: BaseViewController {
    // MARK: - UI Components
    private let checkProblemView = CheckProblemView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "고민 확인하기")
    }
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        view.addSubview(checkProblemView)
    }

    override func setLayout() {
        checkProblemView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
