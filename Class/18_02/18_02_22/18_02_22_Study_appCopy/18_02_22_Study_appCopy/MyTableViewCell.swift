//
//  MyTableViewCell.swift
//  18_02_22_Study_appCopy
//
//  Created by 배지호 on 2018. 2. 22..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var bgView: UIImageView!
    @IBOutlet var bgView2: UIView!
    @IBAction func mainbtn(_ sender: UIButton) {
        
    }
    
    var img: UIImage! {
        get {
            return imgView.image
        }
        set {
            imgView.image = newValue
        }
    }
    
    var bgimg: UIImage! {
        get {
            return bgView.image
        }
        set {
            bgView.image = newValue
        }
    }
    
    var title: String = "" {
        didSet {
            
            mainbtn.setTitleColor(.white, for: .normal)
            mainbtn.setTitleColor(.black, for: .highlighted)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.frame = self.bounds
        bgView2.frame = self.bounds
    }

}
