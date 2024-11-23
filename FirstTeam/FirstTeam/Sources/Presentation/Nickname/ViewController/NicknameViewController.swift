//
//  NicknameViewController.swift
//  FirstTeam
//
//  Created by 김송희 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class NicknameViewController: BaseViewController {
    
    private let nicknameView = NicknameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameView.nicknameTextField.delegate = self
        setObserver()
        setTapGesture()
        setAction()
    }
    
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setUI() {
        view.addSubviews(nicknameView)
    }
    
    override func setLayout() {
        nicknameView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAction() {
        nicknameView.enterButton.addTarget(
            self,
            action: #selector(enterButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func enterButtonTapped() {
        let nickname = nicknameView.nicknameTextField.text ?? ""
        UserDefaults.standard.set(nickname, forKey: "nickname")
        
        let problemWriteViewController = ProblemWriteViewController()
        self.navigationController?.pushViewController(problemWriteViewController, animated: true)
    }
    
    private func setObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        nicknameView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        nicknameView.updateEnterButtonPosition(bottomInset: keyboardHeight + 20, animationDuration: animationDuration)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        nicknameView.updateEnterButtonPosition(bottomInset: 36, animationDuration: animationDuration)
    }
    
    @objc private func dismissKeyboard() {
        nicknameView.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension NicknameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let textRange = Range(range, in: currentText) else {
            return false
        }
        let updatedText = currentText.replacingCharacters(in: textRange, with: string)
        
        if updatedText.count > 0 {
            nicknameView.enterButton.backgroundColor = UIColor(resource: .green0)
            nicknameView.enterButton.isEnabled = true
        } else {
            nicknameView.enterButton.backgroundColor = UIColor(resource: .gray05)
            nicknameView.enterButton.isEnabled = false
        }
        
        if updatedText.count > 12 {
            return false
        } else {
            nicknameView.myLengthLabel.text = "\(updatedText.count)"
            return updatedText.count <= 12
        }
    }
}
