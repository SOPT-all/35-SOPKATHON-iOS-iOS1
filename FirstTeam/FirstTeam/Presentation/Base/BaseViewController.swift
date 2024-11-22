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
