//
//  ProfileViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import Foundation

final class ProfileViewModel: ViewModelType {

    var userModel: FriendModel
    
    init(userModel: FriendModel) {
        self.userModel = userModel
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(from input: Input) -> Output {
        return Output()
    }
    
    func getUserName() -> String {
        return userModel.name
    }
    
    func getUserImage() -> String {
        return userModel.profileImage
    }
}
