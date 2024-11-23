//
//  CompleteProblemView.swift
//  FirstTeam
//
//  Created by 김예지 on 11/23/24.
//

import UIKit

import Then
import SnapKit

final class CompleteProblemView: BaseView {
    // MARK: - UI Components
    private let logoIconImageView = UIImageView().then {
        $0.image = UIImage(resource: .babomandu)
        $0.contentMode = .scaleAspectFill
    }
    
    private let completeInfoLabel = UILabel().then{
        $0.text = "3일만 더 고민해 보삼.\n우리도 함께 고민해 보겠삼!"
        $0.font = .pretendard(.title02)
        $0.textColor = UIColor(resource: .black0)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    lazy var hardWorryButton = UIButton().then{
        $0.setTitle("열심히 고민해 볼게요!", for: .normal)
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
    
    // MARK: - UI, Layout
    override func setUI() {
        self.addSubviews(
            logoIconImageView,
            completeInfoLabel,
            hardWorryButton
        )
    }
    
    override func setLayout(){
        logoIconImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(146)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(160)
        }
        
        completeInfoLabel.snp.makeConstraints{
            $0.top.equalTo(logoIconImageView.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }
        
        hardWorryButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(54)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(15)
        }
    }
}
