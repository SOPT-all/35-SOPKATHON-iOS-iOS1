//
//  SelectionWriteView.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit
import SnapKit
import Then

final class SelectionWriteView: BaseView {
    private let titleLabel = UILabel().then {
        $0.text = "어떤 것 중에 고민이삼?"
        $0.font = .pretendard(.title01)
        $0.textColor = UIColor(resource: .black0)
    }
    
    let firstTextField = CustomTextField(placeholder: "첫 번째 항목을 적어주세요")
    
    let firstCountLabel = UILabel().then {
        $0.text = "0/25"
        $0.font = .pretendard(.caption02)
        $0.textColor = UIColor(resource: .gray05)
    }
    
    let secondTextField = CustomTextField(placeholder: "두 번째 항목을 적어주세요")
    
    let secondCountLabel = UILabel().then {
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
        addSubviews(
            titleLabel,
            firstTextField,
            firstCountLabel,
            secondTextField,
            secondCountLabel,
            nextButton
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().inset(20)
        }
        
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        firstCountLabel.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        secondTextField.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        secondCountLabel.snp.makeConstraints {
            $0.top.equalTo(secondTextField.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
    }
    
}
