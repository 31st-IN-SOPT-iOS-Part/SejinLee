//
//  ImagePickerViewModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/27.
//

import Foundation
import Combine

final class ImagePickerViewModel: ViewModelType {
    
    private var cancelBag = Set<AnyCancellable>()
    var imageList: [ImageModel] = ImageModel.sampleData
    
    init() {
    }
    
    struct Input {
        let viewWillAppear: AnyPublisher<Void, Never>
    }
    
    struct Output {
        var imageList = PassthroughSubject<[ImageModel], Error>()
    }
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppear.sink {[weak self] _ in
            guard let self = self else { return }
            output.imageList.send(self.imageList)
        }.store(in: &self.cancelBag)
        
        return output
    }
}
