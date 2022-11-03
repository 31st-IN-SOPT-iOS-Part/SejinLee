//
//  getClassName.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/26.
//

import UIKit

extension NSObject {
    public static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    public var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
