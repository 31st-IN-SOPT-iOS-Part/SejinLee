//
//  SignupViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/06.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - UI
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "사용하던 카카오 계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = UIColor.gray
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    private let emailTextFieldView = AuthTextFieldView(placeholder: "이메일 또는 전화번호", isSecureTextEntry: false)
    
    private let passwordTextFieldView = AuthTextFieldView(placeholder: "비밀번호", isSecureTextEntry: true)
    
    private let passwordCheckTextFieldView = AuthTextFieldView(placeholder: "비밀번호 확인", isSecureTextEntry: true)
    
    private lazy var signUpFormStackView = UIStackView(
        arrangedSubviews:
            [emailTextFieldView, passwordTextFieldView, passwordCheckTextFieldView])
        .then {
            $0.axis = .vertical
            $0.spacing = 4
    }
    
    private lazy var signUpButton = UIButton(type: .system).then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .systemGray6
        $0.isEnabled = false
        $0.layer.cornerRadius = 10
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
    }
}

extension SignUpViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, descriptionLabel, signUpFormStackView, signUpButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }

        signUpFormStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(signUpFormStackView.snp.bottom).offset(20)
            make.height.equalTo(45)
        }
    }
}
