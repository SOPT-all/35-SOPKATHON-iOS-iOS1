//
//  HomeViewController.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private var model: HomeModel?
    
    private let nicknameLabel = UILabel().then {
        $0.font = .pretendard(.title01)
        $0.textColor = FirstTeamAsset.black0.color
    }
    
    private let problemTitleLabel = UILabel().then {
        $0.font = .pretendard(.title01)
        $0.textColor = FirstTeamAsset.black0.color
        $0.numberOfLines = 2
    }
    
    private let announceLabel = UILabel().then {
        $0.font = .pretendard(.title01)
        $0.textColor = FirstTeamAsset.black0.color
    }
    
    private let subAnnounceLabel = UILabel().then {
        $0.font = .pretendard(.title02)
        $0.textColor = FirstTeamAsset.gray10.color
    }
    
    private let problemImageView = UIImageView()
    
    private lazy var alreadySolveProblemButton = UIButton().then {
        $0.setTitle(
            "혹시... 이미 고민이 해결되었삼?",
            for: .normal
        )
        $0.setTitleColor(FirstTeamAsset.green0.color, for: .normal)
        $0.titleLabel?.font = .pretendard(.body06)
        $0.addUnderline()
        $0.addTarget(
            self,
            action: #selector(alreadySolveProblemButtonTapped),
            for: .touchUpInside
        )
    }
    
    private let bottomContainerView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = CACornerMask(
            arrayLiteral: [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner
            ]
        )
        $0.backgroundColor = FirstTeamAsset.white0.color
    }
    
    private lazy var createProblemButton = HomeButton(title: "고민 작성하기").then {
        $0.addTarget(
            self,
            action: #selector(createProblemButtonTapped),
            for: .touchUpInside
        )
    }
    
    private lazy var problemListButton = HomeButton(title: "해결된 고민 리스트").then {
        $0.addTarget(
            self,
            action: #selector(problemListButtonTapped),
            for: .touchUpInside
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchModel()
    }
    
    // TODO: API 호출로 변경
    private func fetchModel() {
        model = HomeModel.noProblemMockData
//        model = HomeModel.problemExistMockData
        guard let model else { return }
        if model.isProblemExist {
            nicknameLabel.isHidden = true
            problemTitleLabel.text = model.problem ?? ""
            announceLabel.text = "함께 고민하고 있삼!"
            subAnnounceLabel.text = convertDate(date: model.startDate ?? Date())
            createProblemButton.isEnabled = false
            alreadySolveProblemButton.isHidden = false
        } else {
            nicknameLabel.isHidden = false
            nicknameLabel.text = model.nickname
            problemTitleLabel.isHidden = true
            announceLabel.text = "지금 고민 없삼?"
            subAnnounceLabel.text = "같이 고민해주겠삼!"
            createProblemButton.isEnabled = true
            alreadySolveProblemButton.isHidden = true
        }
    }
    
    override func setUI() {
        view.addSubviews(
            nicknameLabel,
            announceLabel,
            subAnnounceLabel,
            problemTitleLabel,
            alreadySolveProblemButton,
            problemImageView,
            bottomContainerView
        )
        
        bottomContainerView.addSubviews(
            createProblemButton,
            problemListButton
        )
    }
    
    override func setStyle() {
        view.backgroundColor = FirstTeamAsset.gray01.color
    }
    
    override func setLayout() {
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.leading.equalToSuperview().inset(20)
        }
        
        announceLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom)
            $0.leading.equalTo(nicknameLabel)
        }
        
        problemTitleLabel.snp.makeConstraints {
            $0.top.equalTo(announceLabel.snp.bottom)
            $0.leading.equalTo(nicknameLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        subAnnounceLabel.snp.makeConstraints {
            $0.top.equalTo(problemTitleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(nicknameLabel)
        }
        
        alreadySolveProblemButton.snp.makeConstraints {
            $0.top.equalTo(subAnnounceLabel.snp.bottom).offset(12)
            $0.leading.equalTo(nicknameLabel)
        }
        
        // TODO: 피그마에 따라 수정
        problemImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        bottomContainerView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(204)
        }
        
        createProblemButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
        
        problemListButton.snp.makeConstraints {
            $0.top.equalTo(createProblemButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
    }
    
    @objc private func createProblemButtonTapped() {
        // TODO: 고민 생성 페이지로 이동
    }
    
    @objc private func problemListButtonTapped() {
        // TODO: 고민 리스트 페이지로 이동
    }
    
    @objc private func alreadySolveProblemButtonTapped() {
        // TODO: 고민 미리 해결 페이지로 이동
    }
    
    private func convertDate(date: Date) -> String {
        var resultString = ""
        var seconds = Int(abs(Date().timeIntervalSince(date)))
        let day = seconds/(60*60*24)
        seconds = seconds % (60*60*24)
        let hour = seconds/(60*60)
        seconds = seconds % (60*60)
        let minute = seconds/60
        if day > 0 {
            resultString += "\(day)일 "
        } else if hour > 0 {
            resultString += "\(hour)시간 "
        }
        resultString += "\(minute)분 째 고민 중..."
        
        return resultString
    }
}
