//
//  CustomCard.swift
//  18_02_11_Study
//
//  Created by 배지호 on 2018. 2. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class CustomCard: UIView {
    
    var backImg: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        backImg?.image = UIImage(named: "caesars-palace-blackjack.jpg")
        backImg?.frame = self.bounds
        self.addSubview(backImg!)
    }
}
