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
    private lazy var problemSolveCompleteView = ProblemSolveCompleteView(
        problemtitle: problemtitle,
        firstChoice: firstChoice,
        secondChoice: secondChoice,
        choiceIndex: choiceIndex
    )
    private let problemtitle: String
    private let firstChoice: String
    private let secondChoice: String
    private let choiceIndex: Int
    
    init(problemtitle: String, firstChoice: String, secondChoice: String, choiceIndex: Int) {
        self.problemtitle = problemtitle
        self.firstChoice = firstChoice
        self.secondChoice = secondChoice
        self.choiceIndex = choiceIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setTarget() {
        problemSolveCompleteView.goProblemListButton.addTarget(self, action: #selector(goProblemListButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func goProblemListButtonDidTap() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
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
