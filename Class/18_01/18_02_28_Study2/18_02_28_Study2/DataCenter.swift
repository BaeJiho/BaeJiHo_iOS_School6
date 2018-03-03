//
//  DataCenter.swift
//  18_02_28_Study2
//
//  Created by 배지호 on 2018. 2. 28..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class DataCenter {
    static var shardInstance: DataCenter = DataCenter()
    private var friendList: [[String: String]]!
    
    
    var friendListModel: [UserModel] {
        var list: [UserModel] = []
        for dic in friendList {
            list.append(UserModel(dic: dic)!)
        }
        return list
    }
    
    private init() {
        loadData()
    }
    
    
    
    private func loadData() {
        if let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
           let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil),
           let list = dic as? [[String: String]] {
            friendList = list
        } else {
            print("oops: something went wrong!!!")
            return
        }
    }
}


struct UserModel {
    var phoneNumber: String
    var profileImage: String
    var profileDescription: String
    var bgImage: String
    var statusDescription: String
    var nickName: String
    var email: String
    
    init?(dic: [String: String]) {
        guard let phone = dic["PhoneNumber"] else { return nil }
        guard let profileImage = dic["ProfileImage"] else { return nil }
        guard let profileDescription = dic["MyProfileDescription"] else { return nil }
        guard let backGroundImg = dic["BackgroundImage"] else { return nil }
        guard let statusDescription = dic["StatusDescription"] else { return nil }
        guard let name = dic["Nickname"] else { return nil }
        guard let email = dic["Email"] else { return nil }
        
        self.phoneNumber = phone
        self.profileImage = profileImage
        self.profileDescription = profileDescription
        self.bgImage = backGroundImg
        self.statusDescription = statusDescription
        self.nickName = name
        self.email = email
    }
}
