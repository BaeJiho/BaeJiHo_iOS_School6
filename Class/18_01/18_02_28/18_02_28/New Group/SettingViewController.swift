//
//  SettingViewController.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    lazy var setting: SettingDataCenter = SettingDataCenter()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return setting.sectionCount()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = setting.rowCount(of: section)
        return data
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = setting[indexPath]
        switch rowData.style{
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! BasicCell
            cell.textLabel?.text = rowData.title
            cell.indexPath = indexPath
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
            cell.textLabel?.text = rowData.title
            
            return cell
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
            cell.textLabel?.text = rowData.title
            return cell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return setting[section]
    }
}
