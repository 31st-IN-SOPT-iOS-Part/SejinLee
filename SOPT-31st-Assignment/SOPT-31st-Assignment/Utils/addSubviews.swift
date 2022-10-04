//
//  addSubviews.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/04.
//

import Foundation

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
