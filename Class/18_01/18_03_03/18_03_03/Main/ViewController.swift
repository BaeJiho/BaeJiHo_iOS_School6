//
//  ViewController.swift
//  18_03_03
//
//  Created by 배지호 on 2018. 3. 3..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    var mainDataCell: [FriendInfo] = MainDataCenter.mainData.friendList

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDataCell.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.dataCell = mainDataCell[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
