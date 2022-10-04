//
//  ViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/02.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
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
    
    private let emailTextFieldView = AuthTextFieldView(placeholder: "이메일 또는 전화번호")
    
    private let passwordTextzFieldView = AuthTextFieldView(placeholder: "비밀번호")
    
    private lazy var loginFormStackView = UIStackView(
        arrangedSubviews:
            [emailTextFieldView, passwordTextzFieldView])
        .then {
            $0.axis = .vertical
            $0.spacing = 4
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
    }
}

// MARK: - Extensions
extension LoginViewController {
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, descriptionLabel, loginFormStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
    
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }

        loginFormStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
    }
}
