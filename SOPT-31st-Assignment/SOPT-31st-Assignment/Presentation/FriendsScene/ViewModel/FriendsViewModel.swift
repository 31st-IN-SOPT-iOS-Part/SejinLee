//
//  FriendsViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import Foundation

class FriendsViewModel: ViewModelType {
    var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(from input: Input) -> Output {
        Output()
    }
    
}
