//
//  ProfileViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import UIKit
import Combine

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: ProfileViewModel!
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - UI
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    private let userImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")
        $0.contentMode = .scaleAspectFill
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .white
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        bind()
    }
}

extension ProfileViewController {
    private func configureUI() {
        view.backgroundColor = UIColor(named: "profileColor")
    }
    
    private func setLayout() {
        view.addSubviews(cancelButton, userImageView, userNameLabel)
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
        }
        userImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(202)
            make.width.height.equalTo(96)
        }
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(userImageView.snp.bottom).offset(8)
        }
        
    }
    
    private func bind() {
        userNameLabel.text = viewModel.getUserName()
    }
    
    // MARK: - Actions
    @objc private func cancelButtonDidTap() {
        self.dismiss(animated: true)
    }
}
