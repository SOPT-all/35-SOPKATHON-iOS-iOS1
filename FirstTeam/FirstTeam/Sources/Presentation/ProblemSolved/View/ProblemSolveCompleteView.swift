//
//  ProblemSolveCompleteView.swift
//  FirstTeam
//
//  Created by 김예지 on 11/24/24.
//

import UIKit

import Then
import SnapKit

class ProblemSolveCompleteView: BaseView {
    // MARK: - UI Components
    
    private let nickNameLabel = UILabel().then {
        $0.text = "000님의"
        $0.font = .pretendard(.title01)
        $0.textColor = UIColor(resource: .black0)
    }
    
    private let solveTitleLabel = UILabel().then {
        $0.text = "고민이 해결되었삼!"
        $0.font = .pretendard(.title01)
        $0.textColor = UIColor(resource: .black0)
    }
    
    private let checkProblemContainerView = UIView().then{
        $0.backgroundColor = UIColor(resource: .white0)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(resource: .gray01).cgColor
    }
    
    private let dateStartLabel = UILabel().then {
        $0.text = "2023.04.04 "
        $0.font = .pretendard(.caption01)
        $0.textColor = UIColor(resource: .gray07)
    }
    
    private let dateEndLabel = UILabel().then {
        $0.text = "- 2024.04.07"
        $0.font = .pretendard(.caption01)
        $0.textColor = UIColor(resource: .gray07)
    }
    
    private let problemTitleLabel = UILabel().then {
        $0.text = "하 다이어트 중인데 불닭 먹기말기 ㅋㅋㅋㅋㅋ 불닭 버전"
        $0.textColor = UIColor(resource: .gray11)
        $0.font = .pretendard(.title03)
        $0.numberOfLines = 0
    }
    
    private let problemItem1Container = UIView().then {
        $0.backgroundColor = UIColor(resource: .gray01)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let problemItem1Label = UILabel().then {
        $0.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십"
        $0.font = .pretendard(.body06)
        $0.textColor = UIColor(resource: .gray09)
        $0.numberOfLines = 0
    }
    
    private let problemItem2Container = UIView().then {
        $0.backgroundColor = UIColor(resource: .gray01)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let problemItem2Label = UILabel().then {
        $0.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십"
        $0.font = .pretendard(.body06)
        $0.textColor = UIColor(resource: .gray09)
        $0.numberOfLines = 0
    }
    
    private let goProblemListButton = UIButton().then {
        $0.setTitle("고민 리스트", for: .normal)
        $0.titleLabel?.font = .pretendard(.subtitle01)
        $0.setTitleColor(UIColor(resource: .white0), for: .normal)
        $0.backgroundColor = UIColor(resource: .green0)
        $0.layer.cornerRadius = 12
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    
    override func setUI() {
        problemItem1Container.addSubview(problemItem1Label)
        problemItem2Container.addSubview(problemItem2Label)
        
        checkProblemContainerView.addSubviews(
            dateStartLabel,
            dateEndLabel,
            problemTitleLabel,
            problemItem1Container,
            problemItem2Container
        )
        
        self.addSubviews(nickNameLabel,
                         solveTitleLabel,
                         checkProblemContainerView,
                         goProblemListButton)
    }

    override func setLayout() {
        nickNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        solveTitleLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom)
            $0.leading.equalTo(nickNameLabel.snp.leading)
        }
        
        checkProblemContainerView.snp.makeConstraints {
            $0.top.equalTo(solveTitleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.greaterThanOrEqualTo(195)
            $0.height.lessThanOrEqualTo(224)
        }
        
        dateStartLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        dateEndLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(24)
            $0.centerY.equalTo(dateStartLabel)
            $0.leading.equalTo(dateStartLabel.snp.trailing)
        }
        
        problemTitleLabel.snp.makeConstraints {
            $0.top.equalTo(dateStartLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        problemItem1Container.snp.makeConstraints {
            $0.top.equalTo(problemTitleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(37)
        }
        
        problemItem1Label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        problemItem2Container.snp.makeConstraints {
            $0.top.equalTo(problemItem1Container.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(37)
        }
        
        problemItem2Label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        goProblemListButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(71)
        }
    }

}
