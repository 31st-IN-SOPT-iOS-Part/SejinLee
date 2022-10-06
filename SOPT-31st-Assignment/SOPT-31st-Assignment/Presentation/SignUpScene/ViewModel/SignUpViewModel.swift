//
//  SignUpViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/06.
//

import Foundation
import Combine

final class SignUpViewModel {
    
    @Published private(set) var isSignUpValid: Bool = false
    
    func signUpFormDidChange(info: (String, String, String)) {
        if info.0 != "" && info.1 != "" && info.2 != "" {
            if info.1 == info.2 {
                isSignUpValid = true
                return
            }
        }
        
        isSignUpValid = false
    }
    
}
