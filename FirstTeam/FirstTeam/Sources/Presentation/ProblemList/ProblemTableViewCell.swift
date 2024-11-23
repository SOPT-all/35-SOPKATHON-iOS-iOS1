//
//  ProblemTableViewCell.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit

import SnapKit
import Then

final class ProblemTableViewCell: UITableViewCell {
    
    static let identifier = "ProblemTableViewCell"
    
    private let checkProblemContainerView = UIView().then{
        $0.backgroundColor = UIColor(resource: .white0)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(resource: .gray01).cgColor
    }
    
    private let dateStartLabel = UILabel().then {
        $0.font = .pretendard(.caption01)
        $0.textColor = UIColor(resource: .gray07)
    }
    
    private let dateEndLabel = UILabel().then {
        $0.font = .pretendard(.caption01)
        $0.textColor = UIColor(resource: .gray07)
    }
    
    private let problemTitleLabel = UILabel().then {
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
        $0.font = .pretendard(.body06)
        $0.textColor = UIColor(resource: .gray09)
        $0.numberOfLines = 0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        worryItem1Container.addSubview(worryItem1Label)
        worryItem2Container.addSubview(worryItem2Label)
        
        checkProblemContainerView.addSubviews(
            dateStartLabel,
            dateEndLabel,
            problemTitleLabel,
            worryItem1Container,
            worryItem2Container
        )
        
        addSubview(checkProblemContainerView)
    }
    
    private func setLayout() {
        checkProblemContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(195)
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
    }
}

extension ProblemTableViewCell {
    func dataBind(_ data: ProblemModel) {
        dateStartLabel.text = data.startDate
        if let endDate = data.endDate {
            dateEndLabel.text = "- \(endDate)"
        }
        problemTitleLabel.text = data.title
        worryItem1Label.text = data.items[0].content
        worryItem1Label.textColor = UIColor(resource:data.items[0].isSelected ? .gray01 : .gray09)
        worryItem1Container.backgroundColor = UIColor(resource: data.items[0].isSelected ? .green0 : .gray01)
        worryItem2Label.text = data.items[1].content
        worryItem2Label.textColor = UIColor(resource:data.items[1].isSelected ? .gray01 : .gray09)
        worryItem2Container.backgroundColor = UIColor(resource: data.items[1].isSelected ? .green0 : .gray01)
    }
}
