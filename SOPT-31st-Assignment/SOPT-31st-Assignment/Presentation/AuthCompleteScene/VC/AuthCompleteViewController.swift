//
//  AuthCompleteViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/05.
//

import UIKit

class AuthCompleteViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: AuthCompleteViewModel!
    
    // MARK: - UI
    private let welcomeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private lazy var completeButton = UIButton(type: .system).then {
        let attrTitle = NSAttributedString(string: "완료", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 20, weight: .semibold)])
        $0.setAttributedTitle(attrTitle, for: .normal)
        $0.backgroundColor = UIColor.yellow
        $0.layer.cornerRadius = 5
        
        $0.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
    }
}

// MARK: - Extensions
extension AuthCompleteViewController {
    private func configureUI() {
        view.backgroundColor = .white
        welcomeLabel.text = viewModel.getWelcomeText()
    }
    
    private func setLayout() {
        view.addSubviews(welcomeLabel, completeButton)
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(200)
        }
        
        completeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(180)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.height.equalTo(45)
        }
    }
    
    // MARK: - Actions
    @objc func completeButtonDidTap() {
        self.dismiss(animated: true)
    }
}
