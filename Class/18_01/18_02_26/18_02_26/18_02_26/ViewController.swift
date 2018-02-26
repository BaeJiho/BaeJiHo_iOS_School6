//
//  ViewController.swift
//  18_02_26
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var subTitleLB: UILabel!
    
    var albumData: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let albumData = Album(dictionary: album) {
            self.albumData = albumData
            self.titleLB.text = albumData.albumInfo.albumTitle
            self.subTitleLB.text = albumData.albumInfo.artist
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (albumData?.songList.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongCell
        
        cell.receivedData = albumData?.songList[indexPath.row]
        return cell
    }
    

}

