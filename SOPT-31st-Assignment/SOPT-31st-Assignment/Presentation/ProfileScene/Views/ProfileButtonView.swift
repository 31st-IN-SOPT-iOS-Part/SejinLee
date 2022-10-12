//
//  ProfileButtonView.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/12.
//

import UIKit

enum ProfileButtonView {
    case chat(title: String)
    case edit(title: String)
    case story(title: String)
    
    func build() -> UIView {
        switch self {
        case .chat(let title), .edit(let title), .story(let title):
            return makeTextField(title: title)
        }
    }
    
    private func makeTextField(title: String) -> UIView {
        let view = UIView(frame: .zero)
        let imageView = UIImageView().then {
            $0.image = makeImage()
            $0.contentMode = .scaleAspectFit
        }
        
        let titleLabel = UILabel().then {
            $0.text = title
            $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            $0.textColor = .white
        }
        
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel]).then {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .center
        }
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(56)
            make.height.equalTo(40)
        }
        
        return view
    }
    
    private func makeImage() -> UIImage {
        switch self {
        case .chat:
            return UIImage(named: "profileTalkImg")!
        case .edit:
            return UIImage(named: "profile_editImg")!
        case .story:
            return UIImage(named: "profileStoryImg")!
        }
    }
}
