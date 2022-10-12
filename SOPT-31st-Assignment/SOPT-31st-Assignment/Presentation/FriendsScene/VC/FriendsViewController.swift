//
//  FriendsViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import UIKit

class FriendsViewController: UIViewController {
    // MARK: - Properties
    var viewModel: FriendsViewModel!

    // MARK: - UI
    private let headerView = HeaderView(title: "친구")
    
    private let userImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")
        $0.contentMode = .scaleAspectFill
    }
    
    private let userInfoView = UIView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setGesture()
    }
}

extension FriendsViewController {
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(headerView, userInfoView)
        
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        userInfoView.addSubviews(userImageView)
        userImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }
    }
    
    func setGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(userInfoViewDidTap))
        userInfoView.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    @objc func userInfoViewDidTap() {
        let profileViewController = ModuleFactory.shared.makeProfileViewController(userModel: viewModel.userModel)
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
    }
}
