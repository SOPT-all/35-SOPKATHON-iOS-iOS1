//
//  ProblemSolveView.swift
//  FirstTeam
//
//  Created by 김예지 on 11/24/24.
//

import UIKit

import Then
import SnapKit

class ProblemSolveView: BaseView {
    // MARK: - Properties
    private var isAfterThreeDays: Bool = true
    
    // MARK: - UI Components
    
    private let problemLabel = UILabel().then {
        $0.text = "아직 고민중이삼?"
        $0.font = .pretendard(.title01)
        $0.textColor = UIColor(resource: .gray10)
        $0.numberOfLines = 0
    }
    
    private let dayPastLabel = UILabel().then {
        $0.text = "고민을 시작한지 3일이 지났삼"
        $0.font = .pretendard(.body01)
        $0.textColor = UIColor(resource: .gray07)
        $0.numberOfLines = 1
    }
    
    private let greenButton = UIButton().then {
        $0.setTitle("나 대신 골라주삼!", for: .normal)
        $0.titleLabel?.font = .pretendard(.subtitle01)
        $0.setTitleColor(UIColor(resource: .white0), for: .normal)
        $0.backgroundColor = UIColor(resource: .green0)
        $0.layer.cornerRadius = 12
    }
    
    private let grayButton = UIButton().then {
        $0.setTitle("해결했어요!", for: .normal)
        $0.titleLabel?.font = .pretendard(.subtitle01)
        $0.setTitleColor(UIColor(resource: .white0), for: .normal)
        $0.backgroundColor = UIColor(resource: .gray05)
        $0.layer.cornerRadius = 12
    }
    
    // MARK: - Initializer
    init(isAfterThreeDays: Bool) {
        self.isAfterThreeDays = isAfterThreeDays
        super.init(frame: .zero)
        updateText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    
    override func setUI() {
        addSubviews(
            grayButton,
            greenButton,
            dayPastLabel,
            problemLabel
        )
    }
    
    override func setLayout() {
        problemLabel.snp.makeConstraints {
            $0.bottom.equalTo(dayPastLabel.snp.top).offset(isAfterThreeDays ? -8 : -18)
            $0.centerX.equalToSuperview()
        }
        
        dayPastLabel.snp.makeConstraints {
            $0.bottom.equalTo(greenButton.snp.top).offset(-34)
            $0.centerX.equalToSuperview()
        }
        
        greenButton.snp.makeConstraints{
            $0.bottom.equalTo(grayButton.snp.top).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
        
        grayButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(250)
        }
    }
    
    func setDaysPassed(_ isAfterThreeDays: Bool) {
        self.isAfterThreeDays = isAfterThreeDays
    }
    
    private func updateText() {
        if isAfterThreeDays {
            problemLabel.text = "아직 고민중이삼?"
            dayPastLabel.text = "고민을 시작한지 3일이 지났삼."
            greenButton.setTitle("나 대신 골라주삼!", for: .normal)
            grayButton.setTitle("해결했어요!", for: .normal)
        } else {
            problemLabel.text = "혹시... 이미 고민이 해결되었삼?"
            dayPastLabel.isHidden = true
            greenButton.setTitle("해결했삼!", for: .normal)
            grayButton.setTitle("아직이요...", for: .normal)
        }
    }
}
