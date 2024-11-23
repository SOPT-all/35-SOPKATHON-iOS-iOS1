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
    
    var problemTitle: String?
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "고민 작성하기")
        setTarget()
        setupDelegate()
        setGesture()
        addKeyboardObservers()
    }
    
    deinit {
        removeKeyboardObservers()
    }
    
    private func setTarget() {
        rootView.firstTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        rootView.secondTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        rootView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private func setupDelegate() {
        rootView.firstTextField.delegate = self
        rootView.secondTextField.delegate = self
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
    private func nextButtonDidTap() {
        let checkProblemViewController = CheckProblemViewController()
        checkProblemViewController.firstText = rootView.firstTextField.text
        checkProblemViewController.secondText = rootView.secondTextField.text
        checkProblemViewController.problemTitle = problemTitle
        self.navigationController?.pushViewController(checkProblemViewController, animated: true)
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

extension SelectionWriteViewController: UITextFieldDelegate {
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
        
        if updatedText.count > 25 {
            return false
        } else {
            return updatedText.count <= 25
        }
    }
}
