//
//  FriendsListTableViewCell.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/26.
//

import UIKit

final class FriendsListTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let userImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")
        $0.contentMode = .scaleAspectFill
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    private let stateMessageLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        $0.textColor = .gray
        $0.numberOfLines = 1
    }
    
    private lazy var infoStackView = UIStackView(arrangedSubviews: [userNameLabel, stateMessageLabel]).then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 6
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension FriendsListTableViewCell {
    func initCell(model: FriendModel) {
        userImageView.image = UIImage(named: model.profileImage)
        userNameLabel.text = model.name
        stateMessageLabel.text = model.stateMessage
    }
    
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(userImageView, infoStackView)
        
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(42)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.leading.equalTo(userImageView.snp.trailing).offset(11)
            make.centerY.equalToSuperview()
        }
    }
}
