//
//  ProbelmWriteView.swift
//  FirstTeam
//
//  Created by 예삐 on 11/23/24.
//

import UIKit

import Then
import SnapKit

final class ProblemWriteView: BaseView {
    private let titleLabel = UILabel().then {
        $0.text = "지금 무엇이 고민이삼?"
        $0.font = .pretendard(.title01)
        $0.textColor = UIColor(resource: .black0)
    }
    
    let titleTextField = CustomTextField(placeholder: "당신의 고민을 작성해 주세요!")
    
    let countLabel = UILabel().then {
        $0.text = "0/25"
        $0.font = .pretendard(.caption02)
        $0.textColor = UIColor(resource: .gray05)
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(resource: .white0), for: .normal)
        $0.titleLabel?.font = .pretendard(.subtitle01)
        $0.backgroundColor = UIColor(resource: .gray05)
        $0.layer.cornerRadius = 12
        $0.isEnabled = false
    }
    
    override func setStyle() {
        backgroundColor = UIColor(resource: .white0)
    }
    
    override func setUI() {
        addSubviews(titleLabel, titleTextField, countLabel, nextButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
    }
}
