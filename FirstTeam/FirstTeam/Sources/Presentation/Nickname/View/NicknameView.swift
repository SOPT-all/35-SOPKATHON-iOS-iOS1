//
//  NicknameView.swift
//  FirstTeam
//
//  Created by 김송희 on 11/23/24.
//

import UIKit

final class NicknameView: BaseView {
    
    private let commentLabel = UILabel().then {
        $0.text = "결정이 어려운 당신,\n닉네임을 입력해 주세요!"
        $0.font = .pretendard(.title01)
        $0.numberOfLines = 2
    }
    
    let nicknameTextField = InsetTextField().then {
        $0.placeholder = "닉네임을 입력해 주세요"
        $0.font = .pretendard(.body02)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = UIColor(resource: .gray01)
        $0.textInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.autocapitalizationType = .none
        $0.clearsOnBeginEditing = false
    }
    
    let myLengthLabel = UILabel().then {
        $0.text = "0"
        $0.font = .pretendard(.caption02)
        $0.textColor = UIColor(resource: .gray05)
    }
    
    private let slashLabel = UILabel().then {
        $0.text = "/"
        $0.font = .pretendard(.caption02)
        $0.textColor = UIColor(resource: .gray05)
    }
    
    private let totalLengthLabel = UILabel().then {
        $0.text = "12"
        $0.font = .pretendard(.caption02)
        $0.textColor = UIColor(resource: .gray05)
    }
    
    lazy var enterButton = UIButton().then {
        $0.setTitle("제 결정을 도와주세요!", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.titleLabel?.font = .pretendard(.subtitle01)
        $0.backgroundColor = UIColor(resource: .gray05)
        $0.layer.cornerRadius = 12
        $0.isEnabled = false
    }
    
    override func setStyle() {
        self.backgroundColor = .white
    }
    
    override func setUI() {
        self.addSubviews(
            commentLabel,
            nicknameTextField,
            myLengthLabel,
            slashLabel,
            totalLengthLabel,
            enterButton
        )
    }
    
    override func setLayout() {
        commentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints{
            $0.top.equalTo(commentLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(332)
            $0.height.equalTo(52)
        }
        
        myLengthLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(4)
            $0.trailing.equalTo(slashLabel.snp.leading).offset(-2)
        }
        
        slashLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(4)
            $0.trailing.equalTo(totalLengthLabel.snp.leading).offset(-2)
        }
        
        totalLengthLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        enterButton.snp.makeConstraints{
            $0.width.equalTo(335)
            $0.height.equalTo(54)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(36)
        }
    }
    
    func updateEnterButtonPosition(bottomInset: CGFloat, animationDuration: Double) {
        enterButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().inset(bottomInset)
        }
        
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
}

class InsetTextField: UITextField {
    var textInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInset)
    }
}

