//
//  AuthTextField.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/04.
//

import UIKit

class AuthTextField: UITextField {
    // MARK: - UI
    private let underLineView = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    
    // MARK: - Initializations
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setPlaceholder(placeholder)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
    }
    
    private func configureUI() {
        
    }
    
}
