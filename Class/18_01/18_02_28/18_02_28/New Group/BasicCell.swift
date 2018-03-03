//
//  BasicCell.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 3. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet var nameLB: UILabel!
    var indexPath: IndexPath? {
        willSet {
            if newValue?.section == 1 && newValue?.row == 0 {
                nameLB.text = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            } else {
                nameLB.text = ""
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
