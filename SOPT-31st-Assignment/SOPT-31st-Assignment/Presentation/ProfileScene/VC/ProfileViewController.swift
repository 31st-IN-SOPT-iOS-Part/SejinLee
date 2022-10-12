//
//  ProfileViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: ProfileViewModel!
    
    // MARK: - UI
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
    }
}

extension ProfileViewController {
    private func configureUI() {
        view.backgroundColor = UIColor(named: "profileColor")
    }
    
    private func setLayout() {
        
    }
}
