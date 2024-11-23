//
//  WaitingView.swift
//  FirstTeam
//
//  Created by 김송희 on 11/24/24.
//

import UIKit

class WaitingView: BaseView {
    
    private let rouletteImageView = UIImageView().then {
        $0.image = UIImage(resource: .roulette)
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "잠시만 기다려주삼!"
        $0.font = .pretendard(.title01)
        $0.textColor = UIColor(resource: .gray10)
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "최고의 선택을 고민하는 중 ..."
        $0.font = .pretendard(.body01)
        $0.textColor = UIColor(resource: .gray07)
    }

    override func setStyle() {
        self.backgroundColor = .white
    }
    
    override func setUI() {
        addSubviews(rouletteImageView, titleLabel, subtitleLabel)
    }
    
    override func setLayout() {
        rouletteImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(244)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(rouletteImageView.snp.bottom).offset(65)
            $0.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }

}
