//
//  TeamCell.swift
//  18_03_14_NSFetchResultsController
//
//  Created by 배지호 on 2018. 3. 14..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var subLB: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgView.image = nil
        nameLB.text = nil
        subLB.text = nil
        
    }

}
