//
//  CustomItem.swift
//  DrinkItem
//
//  Created by 배지호 on 2018. 2. 7..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class CustomItem: UIView {

    var itemImg: UIImageView?
    var subTitle: UILabel?
    var selectorButton: UIButton?
    
    var index: Int = 0 {
        didSet {
            selectorButton?.tag = index
        }
    }
    
    var itemImgChang: UIImage? {
        get {
            return itemImg?.image
        }
        set {
            itemImg?.image = newValue
        }
    }
    
    var itemCashTitle: String? {
        get {
            return subTitle?.text
        }
        set {
            subTitle?.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
        layoutFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        itemImg = UIImageView()
        itemImg?.contentMode = .scaleAspectFit
        itemImg?.layer.borderWidth = 1
        itemImg?.layer.borderColor = UIColor.darkGray.cgColor
        self.addSubview(itemImg!)
        
        subTitle = UILabel()
        subTitle?.textAlignment = NSTextAlignment.right
        subTitle?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(subTitle!)
        
        selectorButton = UIButton(type: .custom)
        self.addSubview(selectorButton!)
    }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        selectorButton?.addTarget(target, action: action, for: controlEvents)
    }
    
    func layoutFrame() {
        let yHeight:CGFloat = self.frame.size.height / 4
        
        itemImg?.frame = self.bounds
        subTitle?.frame = CGRect(x: 0, y: yHeight * 3, width: self.frame.size.width, height: yHeight)
        selectorButton?.frame = self.bounds
        
    }
    
}
