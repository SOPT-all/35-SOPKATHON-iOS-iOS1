//
//  SplashViewController.swift
//  FirstTeam
//
//  Created by 김송희 on 11/24/24.
//

import UIKit

final class SplashViewController: BaseViewController {
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(resource: .splashLogo)
        $0.contentMode = .scaleAspectFit
    }
    
    private let characterImageView = UIImageView().then {
        $0.image = UIImage(resource: .character)
        $0.contentMode = .scaleAspectFit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigateToNicknameViewController()
        }
    }
    
    override func setStyle() {
        view.backgroundColor = UIColor(resource: .green0)
    }

    override func setUI() {
        view.addSubviews(logoImageView, characterImageView)
    }

    override func setLayout() {
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(224)
            $0.leading.equalToSuperview().inset(92)
            $0.height.equalTo(46)
            $0.width.equalTo(192)
        }
        
        characterImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(426)
            $0.centerX.equalToSuperview()
        }
    }

    private func navigateToNicknameViewController() {
        
        var nextViewController = UIViewController()
        
        let token = UserDefaults.standard.string(forKey: "nickname") ?? ""
            if token.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                nextViewController = NicknameViewController()
            } else {
                nextViewController = HomeViewController()
            }

        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}
