//
//  CheckProblemView.swift
//  FirstTeam
//
//  Created by 김예지 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class CheckProblemView: BaseView {
    // MARK: - UI Components
    
    private let checkTitleLabel = UILabel().then {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attributedText = NSMutableAttributedString(
            string: "3일 동안 심사숙고 할 내용을\n한 번 더 확인해 주삼!",
            attributes: [
                .font: UIFont.pretendard(.title01),
                .foregroundColor: UIColor(resource: .black0),
                .paragraphStyle: paragraphStyle
            ]
        )
        
        $0.textAlignment = .left
        $0.attributedText = attributedText
        $0.numberOfLines = 0
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
    
    private let worryItem1Container = UIView().then {
        $0.backgroundColor = UIColor(resource: .gray01)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let worryItem1Label = UILabel().then {
        $0.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십"
        $0.font = .pretendard(.body06)
        $0.textColor = UIColor(resource: .gray09)
        $0.numberOfLines = 0
    }
    
    private let worryItem2Container = UIView().then {
        $0.backgroundColor = UIColor(resource: .gray01)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let worryItem2Label = UILabel().then {
        $0.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십"
        $0.font = .pretendard(.body06)
        $0.textColor = UIColor(resource: .gray09)
        $0.numberOfLines = 0
    }
    
    lazy var applyButton = UIButton().then{
        $0.setTitle("고민 접수하기", for: .normal)
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
    override func setStyle(){
    }
    
    override func setUI() {
        worryItem1Container.addSubview(worryItem1Label)
        worryItem2Container.addSubview(worryItem2Label)
        
        checkProblemContainerView.addSubviews(
            dateStartLabel,
            dateEndLabel,
            problemTitleLabel,
            worryItem1Container,
            worryItem2Container
        )
        
        self.addSubviews(checkTitleLabel,
                         checkProblemContainerView,
                         applyButton)
    }
    
    override func setLayout() {
        checkTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        checkProblemContainerView.snp.makeConstraints {
            $0.top.equalTo(checkTitleLabel.snp.bottom).offset(20)
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
        
        worryItem1Container.snp.makeConstraints {
            $0.top.equalTo(problemTitleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(37)
        }
        
        worryItem1Label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        worryItem2Container.snp.makeConstraints {
            $0.top.equalTo(worryItem1Container.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(37)
        }
        
        worryItem2Label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        applyButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(15)
        }
    }
    
    
}
