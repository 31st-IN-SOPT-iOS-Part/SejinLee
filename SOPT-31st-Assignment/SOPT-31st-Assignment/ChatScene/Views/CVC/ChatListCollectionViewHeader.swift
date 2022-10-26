//
//  ChatListCollectionViewHeader.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/27.
//

import UIKit

final class ChatListCollectionViewHeader: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "myBanner")
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 6
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension ChatListCollectionViewHeader {
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
