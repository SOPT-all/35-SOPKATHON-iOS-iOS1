//
//  SplashViewController.swift
//  FirstTeam
//
//  Created by 김송희 on 11/24/24.
//

import UIKit

final class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigateToNicknameViewController()
        }
    }
    
    private func navigateToNicknameViewController() {
        
        var nextViewController = UIViewController()
        
        let token = UserDefaults.standard.string(forKey: "nickname") ?? ""
            if token.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                nextViewController = NicknameViewController()
            } else {
                // TODO: set home view controller as nextViewController
            }

        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}
