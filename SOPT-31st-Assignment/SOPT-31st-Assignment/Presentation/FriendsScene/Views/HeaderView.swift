//
//  HeaderView.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import UIKit

final class HeaderView: UIView {
    
    // MARK: - UI
    private let titleLabel = UILabel().then {
        $0.text = ""
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        $0.textColor = .black
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = ""
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        $0.textColor = .gray
    }
    
    private let settingButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "gearshape"), for: .normal)
        $0.tintColor = .black
    }
    
    private let subButton = UIButton(type: .system).then {
        $0.tintColor = .black
    }
    
    // MARK: - Initialization
    
    init(title: String) {
        super.init(frame: .zero)
        configureUI(title: title)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    func configureUI(title: String) {
        titleLabel.text = title
    }
    
    func setLayout() {
        addSubviews(titleLabel, subTitleLabel, settingButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(14)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(7)
            make.centerY.equalTo(titleLabel)
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(titleLabel)
        }
    }
    
    func setSubtitle(subTitle: String) -> HeaderView {
        self.subTitleLabel.text = subTitle
        return self
    }
    
    func setSubButton(image: String, action: ((UIAction) -> Void)? = nil) -> HeaderView {
        addSubview(subButton)
        subButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(settingButton.snp.leading).offset(-12)
        }
        self.subButton.setImage(UIImage(named: image), for: .normal)
        if let action = action {
            self.subButton.addAction(UIAction(handler: action), for: .touchUpInside)
        }
        return self
    }
}
