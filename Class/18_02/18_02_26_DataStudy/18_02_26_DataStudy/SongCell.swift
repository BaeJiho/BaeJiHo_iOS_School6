//
//  SongCell.swift
//  18_02_26_DataStudy
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var subSongTitle: UILabel!
    
    var reData: SongList? {
        didSet {
            songTitle.text = reData?.songTitle
            subSongTitle.text = reData?.writer
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
