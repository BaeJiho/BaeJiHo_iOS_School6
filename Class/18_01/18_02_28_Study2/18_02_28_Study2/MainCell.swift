//
//  MainCell.swift
//  18_02_28_Study2
//
//  Created by 배지호 on 2018. 2. 28..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var subLB: UILabel!
    
    var cellData: UserModel? {
        willSet {
            if let data = newValue {
                img.image = UIImage(named: data.profileImage)
                nameLB.text = data.nickName
                subLB.text = data.statusDescription
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
