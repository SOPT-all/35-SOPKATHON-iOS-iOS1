//
//  HomeButton.swift
//  FirstTeam
//
//  Created by 조성민 on 11/24/24.
//

import UIKit

final class HomeButton: UIButton {
    
    private let titleTextLabel = UILabel().then {
        $0.textColor = FirstTeamAsset.white0.color
        $0.font = .pretendard(.subtitle01)
    }
    
    private let accessoryImageView = UIImageView().then {
        $0.tintColor = FirstTeamAsset.white0.color
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleTextLabel.text = title
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        configurationUpdateHandler = { [weak self] button in
            guard let self else { return }
            if button.isEnabled {
                accessoryImageView.image = FirstTeamAsset.icArrowWhite24.image
                backgroundColor = FirstTeamAsset.green0.color
            } else {
                accessoryImageView.image = FirstTeamAsset.icLockWhite24.image
                backgroundColor = FirstTeamAsset.gray05.color
            }
        }
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func setUI() {
        addSubviews(
            titleTextLabel,
            accessoryImageView
        )
    }
    
    private func setLayout() {
        titleTextLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        accessoryImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
    }
}
