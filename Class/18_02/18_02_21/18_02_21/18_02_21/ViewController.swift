//
//  ViewController.swift
//  18_02_21
//
//  Created by 배지호 on 2018. 2. 21..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var friendList:[String] = ["친구1","친구2","친구3","친구4","친구5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableV: UITableView = UITableView(frame: self.view.bounds, style: .plain)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "List")
        view.addSubview(tableV)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath)
        cell.textLabel?.text = friendList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 30, y: 30, width: 30, height: 30)
            btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            btn.setTitle("버튼", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            self.view.addSubview(btn)
        }
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "MyViewController") as! MyViewController
        let cell = tableView.cellForRow(at: indexPath)
        let title = cell?.textLabel?.text
        newVC.text = title
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let newV = UILabel()
        newV.text = "dd"
        newV.backgroundColor = UIColor.darkGray
        return newV
    }
    
    @objc func btnAction(_ sender:UIButton) {
        
    }
    

}
