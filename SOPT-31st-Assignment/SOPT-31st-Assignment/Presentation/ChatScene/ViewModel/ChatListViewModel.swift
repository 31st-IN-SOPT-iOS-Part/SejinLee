//
//  ChatListViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/26.
//

import Foundation
import Combine

final class ChatListViewModel: ViewModelType {
    
    // MARK: - Properties
    
    private var cancelBag = Set<AnyCancellable>()
    var chatList: [ChatModel] = ChatModel.sampleData

    // MARK: - Init
    
    init() {}
    
    // MARK: - Inputs
    
    struct Input {
        let viewWillAppear: AnyPublisher<Void, Never>
    }
    
    // MARK: - Outputs
    
    struct Output {
        var chatList = PassthroughSubject<[ChatModel], Error>()
    }
}

extension ChatListViewModel {
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppear.sink {[weak self] _ in
            guard let self = self else { return }
            output.chatList.send(self.chatList)
        }.store(in: &self.cancelBag)
        
        return output
    }
}
