//
//  SelectionWriteViewController.swift
//  FirstTeam
//
//  Created by 예삐 on 11/24/24.
//

import UIKit
import SnapKit

final class SelectionWriteViewController: BaseViewController {
    private let rootView = SelectionWriteView()
    
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
        rootView.firstTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        rootView.secondTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
    }
    
    private func checkValid(first: String?, second: String?) {
        guard let first = first else { return }
        guard let second = second else { return }
        
        rootView.firstCountLabel.text = "\(first.count)/25"
        rootView.secondCountLabel.text = "\(second.count)/25"
        
        isValid = first.count > 0  && first.count < 25 && second.count > 0  && second.count < 25
        
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
        checkValid(first: rootView.firstTextField.text, second: rootView.secondTextField.text)
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
