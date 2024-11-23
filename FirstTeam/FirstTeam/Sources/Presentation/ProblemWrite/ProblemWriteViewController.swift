//
//  ProblemWriteViewController.swift
//  FirstTeam
//
//  Created by 예삐 on 11/23/24.
//

import UIKit

final class ProblemWriteViewController: BaseViewController {
    
    private let rootView = ProblemWriteView()
    
    private var isValid: Bool = false
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
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
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        checkValid(text: rootView.titleTextField.text)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
