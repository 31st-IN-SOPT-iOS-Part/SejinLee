//
//  LoginViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/05.
//

import Foundation
import Combine

final class LoginViewModel: ViewModelType {
    
    private var cancellable: Set<AnyCancellable> = []
    
    struct Input {
        let emailText: Published<String>.Publisher
        let passwordText: Published<String>.Publisher
    }
    
    struct Output {
        var isLoginValid = PassthroughSubject<Bool, Never>()
    }
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.emailText.combineLatest(input.passwordText).map { info -> Bool in
            return info.0 != "" && info.1 != ""
        }.sink {
            output.isLoginValid.send($0)
        }.store(in: &self.cancellable)
        return output
    }

}
