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
    
    // TODO: API 연결해야 하는 프로퍼티
    var firstText: String?
    var secondText: String?
    var problemTitle: String?
    
    // MARK: - UI Components
    private let checkProblemView = CheckProblemView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
        setupNavigationBarTitle(with: "고민 확인하기")
    }
    override func setStyle() {
        view.backgroundColor = .white
        
        checkProblemView.worryItem1Label.text = firstText
        checkProblemView.worryItem2Label.text = secondText
        checkProblemView.problemTitleLabel.text = problemTitle
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
    
    private func setTarget() {
        checkProblemView.applyButton.addTarget(self, action: #selector(applyButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func applyButtonDidTap() {
        let completeProblemViewController = CompleteProblemViewController(
            firstText: firstText ?? "",
            secondText: secondText ?? "",
            problemTitle: problemTitle ?? ""
        )
        self.navigationController?.pushViewController(completeProblemViewController, animated: true)
    }
}
