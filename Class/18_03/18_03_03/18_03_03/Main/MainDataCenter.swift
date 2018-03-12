//
//  MainDataCenter.swift
//  18_03_03
//
//  Created by 배지호 on 2018. 3. 3..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class MainDataCenter {
    static var mainData: MainDataCenter = MainDataCenter()
    private var dataCenter: [[String:Any]]!
    
    init() {
        loadDataCenter()
    }
    var friendCount: Int {
        return dataCenter.count
    }
    
    var friendList: [FriendInfo] {
        var list: [FriendInfo] = []
        for dic in dataCenter {
            list.append(FriendInfo(dic: dic)!)
        }
        return list
    }
    
    func loadDataCenter() {
        let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist")!
        if let data = try? Data(contentsOf: path.pathURL()) {
            if let list = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [[String: Any]] {
                self.dataCenter = list
            }
        }
    }
}


extension String {
    func pathURL() -> URL {
        return URL(fileURLWithPath: self)
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
struct FriendInfo {
    var phoneNumber: String
    var proFileImage: String
    var myProfileDescription: String
    var backgroundImage: String
    var statusDescription: String
    var nickName: String
    var email: String
    
    init?(dic: [String: Any]) {
        guard let phonNum = dic["PhoneNumber"] as? String else { return nil }
        guard let profileImage = dic["ProfileImage"] as? String else { return nil }
        guard let profileDescription = dic["MyProfileDescription"] as? String else { return nil }
        guard let backgroundimg = dic["BackgroundImage"] as? String else { return nil }
        guard let statusDescription = dic["StatusDescription"] as? String else { return nil }
        guard let nickName = dic["Nickname"] as? String else { return nil }
        guard let email = dic["Email"] as? String else { return nil }
        
        self.phoneNumber = phonNum
        self.proFileImage = profileImage
        self.myProfileDescription = profileDescription
        self.backgroundImage = backgroundimg
        self.statusDescription = statusDescription
        self.nickName = nickName
        self.email = email
        
    }
}
