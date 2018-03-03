//
//  SongCell.swift
//  18_02_26
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet var songName: UILabel!
    @IBOutlet var trackNum: UILabel!
    
    var receivedData: SongList? {
        didSet {
            
            songName.text = receivedData?.songTitle
            if let name = receivedData?.trackNum {
                trackNum.text = String(name)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
