//
//  ViewController.swift
//  18_02_22_Study_appCopy
//
//  Created by 배지호 on 2018. 2. 22..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet var table: UITableView!
    
    let dataSet:[[String:String]] = [["title":"버스 예매","bgID":"1","imgID":"0"],["title":"예매 확인 및 변경","bgID":"3","imgID":"2"],["title":"도착시간안내","bgID":"5","imgID":"4"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let dic = dataSet[indexPath.row]
        cell.title = dic["title"]!
        cell.bgimg = UIImage(named: dic["bgID"]!)
        cell.img = UIImage(named: dic["imgID"]!)
    }
    
    func tableViewd(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

