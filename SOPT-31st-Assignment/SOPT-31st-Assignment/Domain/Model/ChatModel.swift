//
//  ChatModel.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/26.
//

import Foundation

struct ChatModel {
    var profileImage: String
    var name: String
    var message: String
    var time: String
}

extension ChatModel {
    static var sampleData: [ChatModel] {
        return [
            ChatModel(profileImage: "profileImage1", name: "이솝트", message: "안녕~!", time: "오후 23:54"),
            ChatModel(profileImage: "profileImage2", name: "김솝트", message: "반가워", time: "오후 15:04"),
            ChatModel(profileImage: "profileImage3", name: "박솝트", message: "배고파", time: "오후 14:13"),
            ChatModel(profileImage: "profileImage4", name: "윤솝트", message: "고마워", time: "오후 12:13"),
            ChatModel(profileImage: "profileImage5", name: "최솝트", message: "우헤헤", time: "오전 11:54"),
            ChatModel(profileImage: "profileImage6", name: "황솝트", message: "잘가", time: "오전 11:42"),
            ChatModel(profileImage: "profileImage7", name: "정솝트", message: "행복해", time: "오전 10:22"),
            ChatModel(profileImage: "profileImage8", name: "문솝트", message: "즐거워", time: "오전 03:04"),
            ChatModel(profileImage: "profileImage9", name: "강솝트", message: "재밌어", time: "오전 00:01"),
            ChatModel(profileImage: "profileImage1", name: "이솝트", message: "안녕~!", time: "오후 23:54"),
            ChatModel(profileImage: "profileImage2", name: "김솝트", message: "반가워", time: "오후 15:04"),
            ChatModel(profileImage: "profileImage3", name: "박솝트", message: "배고파", time: "오후 14:13"),
            ChatModel(profileImage: "profileImage4", name: "윤솝트", message: "고마워", time: "오후 12:13"),
            ChatModel(profileImage: "profileImage5", name: "최솝트", message: "우헤헤", time: "오전 11:54"),
            ChatModel(profileImage: "profileImage6", name: "황솝트", message: "잘가", time: "오전 11:42"),
            ChatModel(profileImage: "profileImage7", name: "정솝트", message: "행복해", time: "오전 10:22"),
            ChatModel(profileImage: "profileImage8", name: "문솝트", message: "즐거워", time: "오전 03:04"),
            ChatModel(profileImage: "profileImage9", name: "강솝트", message: "재밌어", time: "오전 00:01")
        ]
    }
}
