//
//  DataCenter.swift
//  18_03_02_MyStudy
//
//  Created by 배지호 on 2018. 3. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class DataCenter {
    static var shardInstance: DataCenter = DataCenter()
    private var friendsList: [[String: Any]]!
    
    var mainCell: [friends] {
        var temp: [friends] = []
        for index in friendsList {
            temp.append(friends(dic: index)!)
        }
        return temp
    }
    
    init() {
        loadData()
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist")
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)),
           let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil),
           let list = dic as? [[String: Any]] {
            friendsList = list
        }
    }
}

/*
 <key>PhoneNumber</key>
 <key>ProfileImage</key>
 <key>MyProfileDescription</key>
 <key>BackgroundImage</key>
 <key>StatusDescription</key>
 <key>Nickname</key>
 <key>Email</key>
 */
struct friends {
    var phoneNumber: String
    var profileImage: String
    var profileDescription: String
    var backgroundImage: String
    var statusDescription: String
    var nickName: String
    var email: String
    
    init?(dic:[String: Any]) {
        guard let phoneNum = dic["PhoneNumber"] as? String else { return nil }
        guard let fileImage = dic["ProfileImage"] as? String else { return nil }
        guard let fileDescription = dic["MyProfileDescription"] as? String else { return nil }
        guard let backImg = dic["BackgroundImage"] as? String else { return nil }
        guard let statusDescription = dic["StatusDescription"] as? String else { return nil }
        guard let nickName = dic["Nickname"] as? String else { return nil }
        guard let email = dic["Email"] as? String else { return nil }
        
        self.phoneNumber = phoneNum
        self.profileImage = fileImage
        self.profileDescription = fileDescription
        self.backgroundImage = backImg
        self.statusDescription = statusDescription
        self.nickName = nickName
        self.email = email
    }
}
