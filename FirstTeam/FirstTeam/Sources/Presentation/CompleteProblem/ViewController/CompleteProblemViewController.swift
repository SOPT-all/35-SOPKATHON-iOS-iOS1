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
    private let apiService = APIService()
    
    private var firstText: String
    private var secondText: String
    private var problemTitle: String
    
    init(firstText: String, secondText: String, problemTitle: String) {
        self.firstText = firstText
        self.secondText = secondText
        self.problemTitle = problemTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
    }
    
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
        completeProblemView.hardWorryButton.addTarget(self, action: #selector(hardWorryButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func hardWorryButtonDidTap() {
        apiService.postProblem(
            title: problemTitle,
            firstChoice: firstText,
            secondChoice: secondText) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    
                    let homeViewController = HomeViewController()
                    self.navigationController?.pushViewController(homeViewController, animated: true)
                case .failure(let failure):
                    dump(failure)
                }
            }
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
