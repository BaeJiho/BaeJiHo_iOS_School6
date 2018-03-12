//
//  MainCell.swift
//  18_03_02_MyStudy
//
//  Created by 배지호 on 2018. 3. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var subLB: UILabel!
    
    var mainCell: friends! {
        willSet {
            if let data = newValue {
                self.img.image = UIImage(named: data.profileImage)
                self.nameLB.text = data.nickName
                self.subLB.text = data.statusDescription
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
