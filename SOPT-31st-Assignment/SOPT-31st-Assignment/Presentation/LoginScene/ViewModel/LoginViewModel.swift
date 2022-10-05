//
//  LoginViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/05.
//

import Foundation
import Combine

final class LoginViewModel {
    
    @Published private(set) var isLoginValid: Bool = false
    
    func loginFormDidChange(info: (String, String)) {
        if info.0 != "" && info.1 != "" {
            isLoginValid = true
        } else {
            isLoginValid = false
        }
    }
    
}
