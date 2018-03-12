//
//  ProfileView.swift
//  18_02_01_UITest
//
//  Created by 배지호 on 2018. 2. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    var profileImgView: UIImageView!
    var titleLB: UILabel!
    var subTitleLB: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        profileImgView = UIImageView(frame: CGRect(x: 5, y: 5, width: self.frame.size.width - 10, height: self.frame.size.height - 10))
        self.addSubview(profileImgView)
        
        titleLB = UILabel(frame: CGRect(x: profileImgView.frame.size.width + 5 + 5, y: profileImgView.frame.origin.y, width: self.frame.size.width - self.frame.size.height - 10 - 10, height: CGFloat(30)))
        
        titleLB.font = UIFont.systemFont(ofSize: 16)
        titleLB.textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
