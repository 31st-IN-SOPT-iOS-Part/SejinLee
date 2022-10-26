//
//  FriendsViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import UIKit
import Combine

final class FriendsViewController: UIViewController {
    // MARK: - Properties
    var viewModel: FriendsViewModel!
    private var cancellable: Set<AnyCancellable> = []

    // MARK: - UI
    private let headerView = HeaderView(title: "친구")
    
    private let friendsTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.setValue(0, forKey: "sectionHeaderTopPadding")
    }
        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setDelegate()
        register()
        bind()
    }
}

extension FriendsViewController {
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(headerView, friendsTableView)
        
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        friendsTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setDelegate() {
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
    }
    
    func register() {
        friendsTableView.register(FriendsListTableViewHeader.self, forHeaderFooterViewReuseIdentifier: FriendsListTableViewHeader.className)
    }
    
    func bind() {
        
    }
    
    
    // MARK: - Actions
    @objc func userInfoViewDidTap() {
        let profileViewController = ModuleFactory.shared.makeProfileViewController(userModel: viewModel.userModel)
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendsListTableViewHeader.className)
                as? FriendsListTableViewHeader else { return UIView() }
        headerView.initHeader(model: viewModel.getUserModel())
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
