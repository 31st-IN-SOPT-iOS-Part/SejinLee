//
//  AuthTextField.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/04.
//

import UIKit
import Combine

final class AuthTextFieldView: UIView {
    // MARK: - Properties
    var placeholder = ""
    @Published var text: String = ""
    
    // MARK: - UI
    private let descriptionLabel = UILabel().then {
        $0.textColor = .systemGray4
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.alpha = 0
    }
    
    private let textField = UITextField().then {
        $0.clearButtonMode = .whileEditing
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    
    // MARK: - Initializations
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        configureUI(isSecureTextEntry: isSecureTextEntry)
        setPlaceholder(placeholder)
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(isSecureTextEntry: Bool) {
        self.textField.isSecureTextEntry = isSecureTextEntry
    }
    
    private func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
        self.textField.placeholder = placeholder
        self.descriptionLabel.text = placeholder
    }
    
    private func setLayout() {
        addSubviews(descriptionLabel, underLineView, textField)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(14)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private func setDelegate() {
        self.textField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension AuthTextFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
        
        UIView.animate(withDuration: 0.2) {
            self.descriptionLabel.alpha = 1
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textField.placeholder = self.placeholder
        
        if !textField.hasText {
            UIView.animate(withDuration: 0.2) {
                self.descriptionLabel.alpha = 0
            }
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.text = textField.text ?? ""
    }
}
