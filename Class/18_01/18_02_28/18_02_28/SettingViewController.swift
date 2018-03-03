//
//  SettingViewController.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var settingTableView: UITableView!
    
    var dataInfo: [SettingCellInfo] = SettingDataCenter.dataCenter.settingModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataInfo[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingCellTableViewCell
        let data = dataInfo[indexPath.section].data[indexPath.row].content
        cell?.cellSettingData = data
        
        if dataInfo[indexPath.section].data[indexPath.row].cellStyle == "SettingDetailCell" {
            cell?.accessoryType = .disclosureIndicator
        } else if dataInfo[indexPath.section].data[indexPath.row].cellStyle == "SettingBasicCell" {
            cell?.accessoryType = .none
        } else if dataInfo[indexPath.section].data[indexPath.row].cellStyle == "SettingSwitchCell" {
            let swich = UISwitch(frame: CGRect(x: 345, y: 10, width: 30, height: 30))
            cell?.addSubview(swich)
            
        } else if dataInfo[indexPath.section].data[indexPath.row].cellStyle == "version" {
            let text = UILabel(frame: CGRect(x: 345, y: 10, width: 30, height: 30))
            text.text = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            cell?.addSubview(text)
        }
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataInfo[section].sectionTitle1
    }
}
