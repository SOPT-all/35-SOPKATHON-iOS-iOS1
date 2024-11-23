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
        
        rootView.titleTextField.delegate = self
        
        setupNavigationBarTitle(with: "고민 작성하기")
        setGesture()
        addKeyboardObservers()
    }
    
    deinit {
        removeKeyboardObservers()
    }
        
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
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
                $0.bottom.equalToSuperview().inset(keyboardHeight + 20)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc
    private func keyboardWillHide(_ notification: Notification) {
        guard let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        UIView.animate(withDuration: animationDuration) {
            self.rootView.nextButton.snp.updateConstraints {
                $0.bottom.equalToSuperview().inset(44)
            }
            self.view.layoutIfNeeded()
        }
    }
}

extension ProblemWriteViewController: UITextFieldDelegate {
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
            rootView.nextButton.backgroundColor = UIColor(resource: .green0)
            rootView.nextButton.isEnabled = true
        } else {
            rootView.nextButton.backgroundColor = UIColor(resource: .gray05)
            rootView.nextButton.isEnabled = false
        }
        
        if updatedText.count > 25 {
            return false
        } else {
            rootView.countLabel.text = "\(updatedText.count)/25"
            return updatedText.count <= 25
        }
    }
}

