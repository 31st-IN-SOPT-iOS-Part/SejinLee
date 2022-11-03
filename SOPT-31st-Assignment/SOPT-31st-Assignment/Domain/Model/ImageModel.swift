//
//  ImageModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/11/03.
//

import Foundation

struct ImageModel {
    var imageName: String
}

extension ImageModel {
    static var sampleData: [ImageModel] {
        return (0...23).map { ImageModel(imageName: "galleryImage\($0)") }
    }
}
