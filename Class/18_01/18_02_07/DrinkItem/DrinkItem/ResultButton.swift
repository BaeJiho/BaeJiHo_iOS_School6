//
//  ResultButton.swift
//  DrinkItem
//
//  Created by 배지호 on 2018. 2. 7..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ResultButton: UIView {

    var cashButton: UIButton?
    var cashName: UILabel?
    
    var index: Int = 0 {
        didSet {
            cashButton?.tag = index
        }
    }
    var NameTitle: String? {
        get {
            return cashName?.text
        }
        set {
            cashName?.text = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        resultView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resultView() {
    
        cashName = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        cashName?.layer.borderWidth = 1
        cashName?.layer.cornerRadius = 10
        cashName?.textAlignment = NSTextAlignment.right
        
        cashButton = UIButton(type: .custom)
        cashButton?.frame = self.bounds
        
        
        self.addSubview(cashName!)
        self.addSubview(cashButton!)
        
    }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        cashButton?.addTarget(target, action: action, for: controlEvents)
    }
}
