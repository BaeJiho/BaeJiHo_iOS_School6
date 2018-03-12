//
//  SettingDataCenter.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation
enum CellStyle: String {
    case Basic = "SettingDetailCell"
    case Detail = "SettingBasicCell"
    case Switch = "SettingSwitchCell"
}

class SettingDataCenter {
    var settingData: [SetInfo]!
    
    init() {
        settingData = loadSettingData()
    }
    
    //갯수
    
    func sectionCount() -> Int {
        return settingData.count
    }
    
    func rowCount(of section: Int) -> Int {
        return settingData[section].data.count
    }
    subscript (indexPath: IndexPath) -> SetData {
        let section = indexPath.section
        let row = indexPath.row
        let sectionData = settingData[section]
        let rowData = sectionData.data[row]
        return rowData
    }
    subscript (section: Int) -> String {
        let sectionData = settingData[section]
        return sectionData.sectionTitle
    }
    
    
    
    
    func loadSettingData() -> [SetInfo] {
        var returnList: [SetInfo] = []
        
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
        if let data = try? Data(contentsOf: (path?.pathURL())!) {
            if let list = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [[String: Any]] {
                for dic in list! {
                    if let data = SetInfo(dic: dic) {
                        returnList.append(data)
                    }
                }
            }
        }
        return returnList
    }
    
}

extension String {
    func pathURL() -> URL {
        return URL(fileURLWithPath: self)
    }
}






struct SetInfo {
    var sectionTitle: String
    var data: [SetData] = []
    
    init?(dic: [String: Any]) {
        guard let title = dic["SectionTitle"] as? String else { return nil }
        self.sectionTitle = title
        guard let data = dic["Data"] as? [[String: Any]] else { return nil }
        for da in data {
            if let da = SetData(dic: da) {
                self.data.append(da)
            }
        }
    }
}

struct SetData {
    var title: String
    var style: CellStyle
    
    init?(dic: [String: Any]) {
        guard let title = dic["Content"] as? String else { return nil }
        self.title = title
        guard let styleStr = dic["CellStyle"] as? String else { return nil }
        guard let style = CellStyle(rawValue: styleStr) else { return nil }
        self.style = style
    }
}
