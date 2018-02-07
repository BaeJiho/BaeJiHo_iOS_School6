//
//  DisplayLayout.swift
//  DrinkItem
//
//  Created by 배지호 on 2018. 2. 7..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class DisplayLayout: UIView {

    var display: UILabel!
    var result: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        printDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func printDisplay() {
        display = UILabel()
        result = UILabel()
        
        let margin: CGFloat = 50
        
        display.frame = CGRect(x: margin, y: 0 , width: self.frame.size.width - margin, height: self.frame.size.height / 2)
        display.backgroundColor = UIColor.black
        display.textColor = UIColor.white
        display.textAlignment = .right
        self.addSubview(display)
        
        result.frame = CGRect(x: margin, y: self.frame.size.height / 2 , width: self.frame.size.width - margin, height: self.frame.size.height / 2)
        result.backgroundColor = UIColor.black
        result.textColor = UIColor.white
        result.textAlignment = .right
        self.addSubview(result)
    }

}
