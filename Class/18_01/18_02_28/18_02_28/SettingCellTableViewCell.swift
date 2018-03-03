//
//  SettingCellTableViewCell.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class SettingCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLB: UILabel!
    var cellSettingData: String! {
        willSet {
            nameLB.text = newValue
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
