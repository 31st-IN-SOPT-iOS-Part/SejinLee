//
//  SignUpViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/06.
//

import Foundation
import Combine

final class SignUpViewModel: ViewModelType {
    
    private var cancellable: Set<AnyCancellable> = []
        
    struct Input {
        let emailText: Published<String>.Publisher
        let passwordText: Published<String>.Publisher
        let passwordCheckText: Published<String>.Publisher
    }
    
    struct Output{
        var isSignUpValid = PassthroughSubject<Bool, Never>()
    }

    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.emailText.combineLatest(input.passwordText, input.passwordCheckText).sink { info in
            if info.0 != "" && info.1 != "" && info.2 != "" {
                if info.1 == info.2 {
                    print(info)
                    output.isSignUpValid.send(true)
                }
            } else {
                output.isSignUpValid.send(false)
            }
        }.store(in: &self.cancellable)
        return output
    }
    
}
