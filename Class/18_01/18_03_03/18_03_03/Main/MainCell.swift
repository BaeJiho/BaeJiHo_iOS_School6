//
//  MainCell.swift
//  18_03_03
//
//  Created by 배지호 on 2018. 3. 3..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var nameLB: UILabel!
    @IBOutlet var subNameLB: UILabel!
    
    
    
    var dataCell: FriendInfo? {
        willSet {
            if let data = newValue {
                self.img.image = UIImage(named: data.proFileImage)
                self.nameLB.text = data.nickName
                self.subNameLB.text = data.statusDescription
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
