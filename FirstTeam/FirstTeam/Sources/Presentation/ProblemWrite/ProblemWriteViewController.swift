//
//  ProblemWriteViewController.swift
//  FirstTeam
//
//  Created by 예삐 on 11/23/24.
//

import UIKit
import SnapKit

final class ProblemWriteViewController: BaseViewController {
    
    private let rootView = ProblemWriteView()
    
    private var isValid: Bool = false
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
        setGesture()
        addKeyboardObservers()
    }
    
    deinit {
        removeKeyboardObservers()
    }
    
    private func setTarget() {
        rootView.titleTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
    }
    
    private func checkValid(text: String?) {
        guard let text = text else { return }
        rootView.countLabel.text = "\(text.count)/25"
        isValid = text.count > 0  && text.count < 25
        if isValid {
            rootView.nextButton.backgroundColor = UIColor(resource: .green0)
            rootView.nextButton.isEnabled = true
        } else {
            rootView.nextButton.backgroundColor = UIColor(resource: .gray05)
            rootView.nextButton.isEnabled = false
        }
    }
    
    private func addKeyboardObservers() {
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
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        checkValid(text: rootView.titleTextField.text)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        let keyboardHeight = keyboardFrame.height
        UIView.animate(withDuration: animationDuration) {
            self.rootView.nextButton.snp.updateConstraints {
                $0.bottom.equalToSuperview().inset(keyboardHeight + 20) // 키보드 위 20pt 여백
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc
    private func keyboardWillHide(_ notification: Notification) {
        guard let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        UIView.animate(withDuration: animationDuration) {
            self.rootView.nextButton.snp.updateConstraints {
                $0.bottom.equalToSuperview().inset(44) // 원래 위치로 복원
            }
            self.view.layoutIfNeeded()
        }
    }
}
