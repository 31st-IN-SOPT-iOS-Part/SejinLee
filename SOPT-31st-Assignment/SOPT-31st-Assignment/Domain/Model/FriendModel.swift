//
//  FriendModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/26.
//

import Foundation

struct FriendModel {
    var profileImage: String
    var name: String
    var stateMessage: String
}

extension FriendModel {
    static var sampleData: [FriendModel] {
        return [
            FriendModel(profileImage: "profileImage1", name: "이솝트", stateMessage: "안녕~!"),
            FriendModel(profileImage: "profileImage2", name: "김솝트", stateMessage: "반가워"),
            FriendModel(profileImage: "profileImage3", name: "박솝트", stateMessage: "배고파"),
            FriendModel(profileImage: "profileImage4", name: "윤솝트", stateMessage: "고마워"),
            FriendModel(profileImage: "profileImage5", name: "최솝트", stateMessage: "우헤헤"),
            FriendModel(profileImage: "profileImage6", name: "황솝트", stateMessage: "잘가"),
            FriendModel(profileImage: "profileImage7", name: "정솝트", stateMessage: "행복해"),
            FriendModel(profileImage: "profileImage8", name: "문솝트", stateMessage: "즐거워"),
            FriendModel(profileImage: "profileImage9", name: "강솝트", stateMessage: "재밌어"),
        ]
    }
}
