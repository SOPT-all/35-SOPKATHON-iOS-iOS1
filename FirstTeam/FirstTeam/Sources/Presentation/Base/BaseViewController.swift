//
//  BaseViewController.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

import Then

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setStyle()
        setUI()
        setLayout()
    }
    
    /// 네비게이션바 커스텀
    func setNavigation() {}
    
    /// UI 컴포넌트 속성 설정 (do 메서드 관련)
    func setStyle() {}
    
    /// UI 위계 설정 (addSubView 등)
    func setUI() {}
    
    /// 오토레이아웃 설정 (SnapKit 코드 관련)
    func setLayout() {}
}

extension BaseViewController {
    
    /// 네비게이션 바 타이틀 및 배경색 설정
    func setupNavigationBarTitle(with string: String) {
        title = string
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.shadowColor = nil
        barAppearance.backgroundColor = UIColor(resource: .white0)
        
        barAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(resource: .black0),
            .font: UIFont.pretendard(.title03)
        ]
        
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        
        setupNavigationBarBackButton()
    }
    
    /// 네비게이션 바 BackButton 구성
    func setupNavigationBarBackButton() {
        let backButton = UIBarButtonItem(
            image: UIImage(named: "ic_arrow_left"),
            style: .plain,
            target: self,
            action: #selector(backButtonDidTap)
        ).then {
            $0.tintColor = UIColor(resource: .black0)
        }
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc
    func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
