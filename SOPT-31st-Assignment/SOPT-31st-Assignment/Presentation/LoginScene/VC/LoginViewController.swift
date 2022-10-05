//
//  ViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/02.
//

import UIKit
import Combine
import SnapKit
import Then

class LoginViewController: UIViewController {
    // MARK: - Properties
    var viewModel: LoginViewModel!
    private var cancellable: Set<AnyCancellable> = []
    
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
    
    private lazy var loginFormStackView = UIStackView(
        arrangedSubviews:
            [emailTextFieldView, passwordTextFieldView])
        .then {
            $0.axis = .vertical
            $0.spacing = 4
    }
    
    private lazy var loginButton = UIButton(type: .system).then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .systemGray6
        $0.isEnabled = false
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private let makeAccountButton = UIButton(type: .system).then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    
    private let findAccountButton = UIButton(type: .system).then {
        $0.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [loginButton, makeAccountButton, findAccountButton]).then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        bind()
    }
}

// MARK: - Extensions
extension LoginViewController {
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, descriptionLabel, loginFormStackView, buttonStackView)
        
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
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(loginFormStackView.snp.bottom).offset(20)
            make.height.equalTo(150)
        }
    }
    
    private func bind() {
        self.viewModel = LoginViewModel()
        
        emailTextFieldView.$text.combineLatest(passwordTextFieldView.$text).sink {[weak self] info in
            self?.viewModel.loginFormDidChange(info: info)
        }.store(in: &self.cancellable)
        
        viewModel.$isLoginValid.sink {[weak self] isValid in
            self?.loginButton.backgroundColor = isValid ? UIColor.yellow : UIColor.systemGray6
            self?.loginButton.isEnabled = isValid
        }.store(in: &self.cancellable)
    }
    
    // MARK: - Actions
    @objc private func loginButtonDidTap() {
        let userModel = UserModel(emailOrPhoneNumber: emailTextFieldView.text, password: passwordTextFieldView.text)
        let authCompleteViewModel = AuthCompleteViewModel(userModel: userModel)
        let authCompleteViewController = AuthCompleteViewController()
        authCompleteViewController.viewModel = authCompleteViewModel
        
        authCompleteViewController.modalPresentationStyle = .fullScreen
        self.present(authCompleteViewController, animated: true)
    }
}
