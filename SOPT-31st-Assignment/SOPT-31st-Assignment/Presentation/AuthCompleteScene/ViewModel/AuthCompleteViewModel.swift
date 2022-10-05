//
//  AuthCompleteViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/05.
//

import Foundation

struct AuthCompleteViewModel {
    var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    func getWelcomeText() -> String {
        return "\(userModel.emailOrPhoneNumber)님\n환영합니다"
    }
}
