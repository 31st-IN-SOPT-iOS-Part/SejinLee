//
//  ProfileViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import UIKit
import Combine

final class ProfileViewController: UIViewController {
    
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
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let chatButtonView = ProfileButtonViews.chat(title: "나와의 채팅").build()
    
    private let editButtonView = ProfileButtonViews.edit(title: "프로필 편집").build()
    
    private let storyButtonView = ProfileButtonViews.story(title: "카카오스토리").build()
    
    private lazy var buttonStackView = UIStackView(
        arrangedSubviews: [chatButtonView, editButtonView, storyButtonView]
    ).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setGesture()
        bind()
    }
}

extension ProfileViewController {
    private func configureUI() {
        view.backgroundColor = UIColor(named: "profileColor")
    }
    
    private func setLayout() {
        view.addSubviews(cancelButton, userImageView, userNameLabel, dividerView, buttonStackView)
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
        }
        userImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(200)
            make.width.height.equalTo(96)
        }
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(userImageView.snp.bottom).offset(8)
        }
        dividerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(userNameLabel.snp.bottom).offset(42)
            make.height.equalTo(1)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(12)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(278)
            make.height.equalTo(72)
        }
    }
    
    private func setGesture() {
        setTapGesture()
    }
    
    private func setTapGesture() {
        buttonStackView.arrangedSubviews.forEach {
            let tap = UITapGestureRecognizer(target: self, action: #selector(profileButtonDidTap(_:)))
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(tap)
        }
    }
    
    private func bind() {
        userImageView.image = UIImage(named: viewModel.getUserImage())
        userNameLabel.text = viewModel.getUserName()
    }
    
    // MARK: - Actions
    @objc private func cancelButtonDidTap() {
        self.dismiss(animated: true)
    }
        
    @objc private func profileButtonDidTap(_ sender: UITapGestureRecognizer) {
        switch sender.view {
        case chatButtonView:
            print("chat button did tap")
        case editButtonView:
            print("edit button did tap")
        case storyButtonView:
            print("story button did tap")
        default:
            print("Tap not detected")
        }
    }
}
