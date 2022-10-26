//
//  FriendsViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/11.
//

import Foundation
import Combine

final class FriendsViewModel: ViewModelType {
    
    // MARK: - Properties
    
    var userModel: UserModel
    private var cancelBag = Set<AnyCancellable>()
    var friendsList: [FriendModel] = FriendModel.sampleData

    // MARK: - Init
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    // MARK: - Inputs
    
    struct Input {
        let viewWillAppear: AnyPublisher<Void, Never>
    }
    
    // MARK: - Outputs
    
    struct Output {
        var friendsList = PassthroughSubject<[FriendModel], Error>()
    }
}

extension FriendsViewModel {
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppear.sink {[weak self] _ in
            guard let self = self else { return }
            output.friendsList.send(self.friendsList)
        }.store(in: &self.cancelBag)
        
        return output
    }
    
    func getUserModel() -> FriendModel {
        return FriendModel(profileImage: "imageFriend", name: userModel.emailOrPhoneNumber, stateMessage: "상태 메세지는 여기에")
    }
}
