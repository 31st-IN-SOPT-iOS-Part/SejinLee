//
//  ViewModelType.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/08.
//

import Foundation

protocol ViewModelType{
  associatedtype Input
  associatedtype Output
  
  func transform(from input: Input) -> Output
}
