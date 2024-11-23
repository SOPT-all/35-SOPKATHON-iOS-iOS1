//
//  ExampleViewController.swift
//  FirstTeam
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class ExampleViewController: BaseViewController {
    private let label = UILabel().then {
        $0.text = "a" + Environment.baseURL
        $0.font = UIFont.pretendard(.title01)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBlue
    }
    
    override func setUI() {
        view.addSubview(label)
    }
    
    override func setLayout() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
