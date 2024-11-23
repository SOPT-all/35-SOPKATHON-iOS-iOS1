//
//  WaitingViewController.swift
//  FirstTeam
//
//  Created by 김송희 on 11/24/24.
//

import UIKit

class WaitingViewController: BaseViewController {

    private let waitingView = WaitingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigateToNextViewController()
        }
    }
    
    override func setUI() {
        view.addSubview(waitingView)
    }
    
    override func setLayout() {
        waitingView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func navigateToNextViewController() {
        // TODO: Transition to next view controller
    }
    
}
