//
//  ImageListCollectionViewCell.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/11/03.
//

import UIKit

final class ImageListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension ImageListCollectionViewCell {
    
    func initCell(imageName: String) {
        self.imageView.image = UIImage(named: imageName)
    }
    
    private func setUI() {
        contentView.backgroundColor = .blue
    }
    
    private func setLayout() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
