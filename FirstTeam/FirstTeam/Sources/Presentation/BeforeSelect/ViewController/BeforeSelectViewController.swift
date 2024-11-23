//
//  BeforeSelectViewController.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

import UIKit

final class BeforeSelectViewController: BaseViewController {
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
            action: #selector(choiceButtonTapped),
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchModel()
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
    
    private func fetchModel() {
        let data = BeforeSelectModel.mockData
        firstChoiceButton.setTitle(
            data.firstChoice,
            for: .normal
        )
        secondChoiceButton.setTitle(
            data.secondChoice,
            for: .normal
        )
    }
    
    @objc private func choiceButtonTapped() {
        // TODO: API 호출
        // TODO: 뷰 연결
    }
}
