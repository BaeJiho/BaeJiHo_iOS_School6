//
//  SetViewController.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var setTableView: UITableView!
    
    var setList:[SetInfo] = SetDataCenter.dataCenter.da
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return setList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setList[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! SetTableViewCell
        cell.setCell = setList[indexPath.section].data[indexPath.row].content
        
        if setList[indexPath.section].data[indexPath.row].cellStyle == "SettingDetailCell" {
            cell.accessoryType = .disclosureIndicator
        } else if setList[indexPath.section].data[indexPath.row].cellStyle == "SettingBasicCell" {
            cell.accessoryType = .none
        } else if setList[indexPath.section].data[indexPath.row].cellStyle == "SettingSwitchCell" {
            let swich = UISwitch(frame: CGRect(x: 340, y: 5, width: 30, height: 30))
            cell.addSubview(swich)
        } else if setList[indexPath.section].data[indexPath.row].cellStyle == "version" {
            let text = UILabel(frame: CGRect(x: 345, y: 10, width: 30, height: 30))
            text.text = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            cell.addSubview(text)
        }
        return cell
    }
    

}
