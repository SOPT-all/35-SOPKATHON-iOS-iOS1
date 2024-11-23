//
//  CompleteProblemViewController.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

import Then
import SnapKit

final class CompleteProblemViewController: BaseViewController {
    // MARK: - UI Components
    private let completeProblemView = CompleteProblemView()
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        view.addSubview(completeProblemView)
    }

    override func setLayout() {
        completeProblemView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
