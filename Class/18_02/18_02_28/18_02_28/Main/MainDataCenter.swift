//
//  MainDataCenter.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 2. 28..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class MainDataCenter {
    static var sharedInstance:MainDataCenter = MainDataCenter()
    private var friendList:[[String:String]]!
    
    var friendListModel:[UserModel] {
        var list:[UserModel] = []
        for dic in friendList {
            list.append(UserModel(dic: dic)!)
        }
        return list
    }
    
    private init() {
        loadFriendList()
    }
    
    private func loadFriendList() {
        let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let property = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let list = property as! [[String: String]]
        friendList = list
    }
    
//    func friendData(with index: Int) -> UserModel {
//        let dic = friendList[index]
//        return UserModel(dic: dic)!
//    }
}


/*
<key>PhoneNumber</key>
<string>010-1234-5678</string>
<key>ProfileImage</key>
<string>ProfileImage1</string>
<key>MyProfileDescription</key>
<string>프로듀스 101의 피지컬 甲 진중함과 코믹함, 카리스마와 귀여움이 공존하는 프리스틴의 리더 그리고 영원히 기억될 I.O.I의 리더</string>
<key>Account</key>
<string>user1</string>
<key>Password</key>
<string>user1</string>
<key>BackgroundImage</key>
<string>BackImage1</string>
<key>StatusDescription</key>
<string>다이어트중</string>
<key>Nickname</key>
<string>강미나</string>
<key>Email</key>
<string>mnkang123@fastcampus.co.kr</string>
<key>LikeCount</key>
 */
struct UserModel {
    var phoneNumber: String
    var profileImgUrl: String
    var profileDescription: String
    var bgImgUrl: String
    var statusDescription: String
    var nickName: String
    var email: String
    
    init?(dic: [String:String]) {
        guard let phoneNumber = dic["PhoneNumber"] else { return nil }
        guard let profileImg = dic["ProfileImage"] else { return nil }
        guard let profileDescription = dic["MyProfileDescription"] else { return nil }
        guard let bgImg = dic["BackgroundImage"] else { return nil }
        guard let statusDes = dic["StatusDescription"] else { return nil }
        guard let nick = dic["Nickname"] else { return nil }
        guard let email = dic["Email"] else { return nil }
        
        self.phoneNumber = phoneNumber
        self.profileImgUrl = profileImg
        self.profileDescription = profileDescription
        self.bgImgUrl = bgImg
        self.statusDescription = statusDes
        self.nickName = nick
        self.email = email
    }
    
}
