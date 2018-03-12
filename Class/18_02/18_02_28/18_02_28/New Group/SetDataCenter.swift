//
//  SetDataCenter.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation
enum CellStyle: String {
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
}

class SetDataCenter {
    static var dataCenter:SetDataCenter = SetDataCenter()
    var dataList: [[String:Any]]!
    
    var da: [SetInfo] {
        var list: [SetInfo] = []
        for index in dataList {
            list.append(SetInfo(dic: index)!)
        }
        return list
    }
    
    private init() {
        loadData()
    }
    
    private func loadData() {
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)),
            let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil),
            let list = dic as? [[String: Any]] {
            self.dataList = list
            
        }
    }
}


struct SetInfo {
    var settingTitle: String
    var data: [SetData]
    
    init?(dic: [String: Any]) {
        guard let title = dic["SectionTitle"] as? String else { return nil }
        guard let data = dic["Data"] as? [[String: Any]] else { return nil }
        
        self.settingTitle = title
        var temp: [SetData] = []
        for list in data {
            temp.append(SetData(dic: list)!)
        }
        self.data = temp
    }
}

struct SetData {
    var cellStyle: String
    var content: String
    
    init?(dic: [String: Any]) {
        guard let cells = dic["CellStyle"] as? String else { return nil }
        guard let con = dic["Content"] as? String else { return nil }
        
        self.cellStyle = cells
        self.content = con
    }
}
