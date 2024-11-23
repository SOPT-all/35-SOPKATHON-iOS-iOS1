//
//  BeforeSelectViewController.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

import UIKit

final class BeforeSelectViewController: BaseViewController {
    private let apiService = APIService()
    private let problemID: Int
    private let announceLabel = UILabel().then {
        $0.text = "뭘 선택했삼?"
        $0.font = .pretendard(.title01)
        $0.textColor = FirstTeamAsset.black0.color
    }
    
    private lazy var firstChoiceButton = UIButton().then {
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = FirstTeamAsset.gray02.color.cgColor
        $0.titleLabel?.font = .pretendard(.body01)
        $0.setTitleColor(FirstTeamAsset.black0.color, for: .normal)
        $0.addTarget(
            self,
            action: #selector(firstChoiceButtonTapped),
            for: .touchUpInside
        )
    }
    
    private lazy var secondChoiceButton = UIButton().then {
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = FirstTeamAsset.gray02.color.cgColor
        $0.titleLabel?.font = .pretendard(.body01)
        $0.titleLabel?.textColor = FirstTeamAsset.black0.color
        $0.setTitleColor(FirstTeamAsset.black0.color, for: .normal)
        $0.addTarget(
            self,
            action: #selector(secondChoiceButtonTapped),
            for: .touchUpInside
        )
    }
    
    init(problemID: Int, firstChoice: String, secondChoice: String) {
        self.problemID = problemID
        super.init(nibName: nil, bundle: nil)
        firstChoiceButton.setTitle(firstChoice, for: .normal)
        secondChoiceButton.setTitle(secondChoice, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        view.backgroundColor = FirstTeamAsset.white0.color
    }
    
    override func setUI() {
        view.addSubviews(
            announceLabel,
            firstChoiceButton,
            secondChoiceButton
        )
    }
    
    override func setLayout() {
        announceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(274)
        }
        
        firstChoiceButton.snp.makeConstraints {
            $0.top.equalTo(announceLabel.snp.bottom).offset(52)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
        
        secondChoiceButton.snp.makeConstraints {
            $0.top.equalTo(firstChoiceButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
    }
    
    @objc private func firstChoiceButtonTapped() {
        // TODO: API 호출
        // TODO: 뷰 연결
        apiService.putProblemSolve(
            problemID: self.problemID,
            choiceIndex: 0) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    dump(success)
                    // TODO: 뷰 연결
                case .failure(let failure):
                    dump(failure)
                }
            }
    }
    
    @objc private func secondChoiceButtonTapped() {
        // TODO: API 호출
        // TODO: 뷰 연결
        apiService.putProblemSolve(
            problemID: self.problemID,
            choiceIndex: 1) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    dump(success)
                    // TODO: 뷰 연결
                case .failure(let failure):
                    dump(failure)
                }
            }
    }
    
}
