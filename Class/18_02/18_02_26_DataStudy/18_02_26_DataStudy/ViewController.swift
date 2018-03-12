//
//  ViewController.swift
//  18_02_26_DataStudy
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var subTitleLB: UILabel!
    
    var data: AlbumData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mainTitle = AlbumData(dic: album) {
            self.data = mainTitle
            self.titleLB.text = mainTitle.info.albumTitle
            self.subTitleLB.text = mainTitle.info.artist
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = data {
            return data.list.count
        } else {
            return 0
        }
//        return data?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongCell
        cell.reData = data?.list[indexPath.row]
        print("\(cell)")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

