//
//  MainCell.swift
//  18_02_28
//
//  Created by 배지호 on 2018. 2. 28..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet var nameLB: UILabel!
    @IBOutlet var subNameLB: UILabel!
    @IBOutlet var img: UIImageView!
    
    var cellData:UserModel? {
        willSet {
            if let data = newValue {
                nameLB.text = data.nickName
                subNameLB.text = data.statusDescription
                img.image = UIImage(named: data.profileImgUrl)
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
