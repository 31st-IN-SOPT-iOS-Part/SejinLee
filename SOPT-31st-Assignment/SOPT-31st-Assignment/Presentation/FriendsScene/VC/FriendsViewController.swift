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
    var viewWillAppear = PassthroughSubject<Void, Never>()
    private var friendsList = [FriendModel]()

    // MARK: - UI
    private let headerView = HeaderView(title: "친구")
    
    private let friendsTableView = UITableView(frame: .zero, style: .grouped).then {
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
        bindViewModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppear.send()
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
        friendsTableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: FriendsListTableViewCell.className)
    }
    
    func bindViewModels() {
        let input = FriendsViewModel.Input(viewWillAppear: viewWillAppear.eraseToAnyPublisher())
        let output = viewModel.transform(from: input)
        
        output.friendsList
            .receive(on: RunLoop.main)
            .sink { event in
                print("event: \(event)")
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.friendsList = value
                self.friendsTableView.reloadData()
            }.store(in: &self.cancellable)
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
        return friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsListTableViewCell.className, for: indexPath)
                as? FriendsListTableViewCell else { return UITableViewCell() }
        cell.initCell(model: friendsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileViewController = ModuleFactory.shared.makeProfileViewController(userModel: self.friendsList[indexPath.row])
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
    }
}
