//
//  SettingDataCenter.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class SettingDataCenter {
    static var dataCenter:SettingDataCenter = SettingDataCenter()
    private var settingData: [[String:Any]]!
    
    
    
    var settingModel: [SettingCellInfo] {
        var list:[SettingCellInfo] = []
        for index in settingData {
            list.append(SettingCellInfo(title: index)!)
        }
        return list
    }
    
    private init() {
        loadData()
    }
    
    private func loadData() {
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let dic = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let list = dic as! [[String: Any]]
        self.settingData = list
        }
    }

    
//    private func loadData() {
//        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
//        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
//        let dic = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
//        let list = dic as? [[String: String]]
//        self.settingData = list
//
//    }



//struct mix {
//    var settingInfo: SettingCellInfo
//    var settingData: [SettingData] = []
//
//    init?(dic: [String: Any]) {
//        guard let info = dic["SectionTitle"] as? [String: Any] else { return nil }
//        guard let dataList = dic["Data"] as? [[String: Any]] else { return nil }
//        self.settingInfo = SettingCellInfo(title: info)!
//        var temp: [SettingData] = []
//        for index in dataList {
//            if let index = SettingData(dic: index) {
//                temp.append(index)
//            }
//        }
//        self.settingData = temp
//    }
//}

struct SettingCellInfo {
    var sectionTitle1: String
    var data: [SettingData]
    
    init?(title: [String: Any]) {
        guard let sectionT = title["SectionTitle"] as? String else { return nil }
        guard let dataList = title["Data"] as? [[String: Any]] else { return nil }
        
        self.sectionTitle1 = sectionT
        
        var temp: [SettingData] = []
        for list in dataList {
            if let index = SettingData(dic: list) {
                temp.append(index)
            }
        }
        self.data = temp
        
        
    }
}

struct SettingData {
    var cellStyle: String
    var content: String
    
    init?(dic:[String: Any]) {
        guard let cellStyle = dic["CellStyle"] as? String else { return nil }
        guard let content = dic["Content"] as? String else { return nil }
        
        self.cellStyle = cellStyle
        self.content = content
    }
}
