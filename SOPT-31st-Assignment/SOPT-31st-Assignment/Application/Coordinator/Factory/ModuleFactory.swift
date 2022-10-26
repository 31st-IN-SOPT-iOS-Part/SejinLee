//
//  ModuleFactory.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/06.
//

import Foundation

protocol ModuleFactoryProtocol {
    func makeKakaoTabBarController() -> KakaoTabbarController
    func makeLoginViewController() -> LoginViewController
    func makeSignUpViewConroller() -> SignUpViewController
    func makeAuthCompleteViewController(emailOrPhoneNumber: String,
                                        password: String) -> AuthCompleteViewController
    func makeFriendsViewController(userModel: UserModel) -> FriendsViewController
    func makeProfileViewController(userModel: FriendModel) -> ProfileViewController
    func makeChatListViewController() -> ChatListViewController
}

final class ModuleFactory: ModuleFactoryProtocol {
    static let shared = ModuleFactory()
    private init() {}
    
    func makeKakaoTabBarController() -> KakaoTabbarController {
        let tabBarController = KakaoTabbarController()
        
        return tabBarController
    }
    
    func makeLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        let viewModel = LoginViewModel()
        loginViewController.viewModel = viewModel
        
        return loginViewController
    }
    
    func makeSignUpViewConroller() -> SignUpViewController {
        let viewModel = SignUpViewModel()
        let signUpViewController = SignUpViewController()
        signUpViewController.viewModel = viewModel
        
        return signUpViewController
    }
    
    func makeAuthCompleteViewController(emailOrPhoneNumber: String, password: String) -> AuthCompleteViewController {
        let model = UserModel(emailOrPhoneNumber: emailOrPhoneNumber,
                              password: password)
        let viewModel = AuthCompleteViewModel(userModel: model)
        let authCompleteViewController = AuthCompleteViewController()
        authCompleteViewController.viewModel = viewModel
        
        return authCompleteViewController
    }
    
    func makeFriendsViewController(userModel: UserModel) -> FriendsViewController {
        let viewModel = FriendsViewModel(userModel: userModel)
        let friendsViewController = FriendsViewController()
        friendsViewController.viewModel = viewModel
        return friendsViewController
    }
    
    func makeProfileViewController(userModel: FriendModel) -> ProfileViewController {
        let viewModel = ProfileViewModel(userModel: userModel)
        let profileViewController = ProfileViewController()
        profileViewController.viewModel = viewModel
        return profileViewController
    }
    
    func makeChatListViewController() -> ChatListViewController {
        let viewModel = ChatListViewModel()
        let chatListViewController = ChatListViewController()
        chatListViewController.viewModel = viewModel
        return chatListViewController
    }
}
