//
//  NewViewController.swift
//  18_02_21
//
//  Created by 배지호 on 2018. 2. 21..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var friendList:[String] = ["1친구1","1친구2","1친구3","1친구4","1친구5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = friendList[indexPath.row]
        return cell
    }
    
}
