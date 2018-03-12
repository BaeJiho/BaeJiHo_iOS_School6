//
//  CustomView.swift
//  18_02_03_Replay_UI
//
//  Created by 배지호 on 2018. 2. 3..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var bgImgView: UIImageView?
    var titleLb: UILabel?
    var subTitle: UILabel?
    var btn: UIButton?
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        toolSet()
        layoutFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toolSet() {
        bgImgView = UIImageView()
        self.addSubview(bgImgView!)
        
        titleLb = UILabel()
        self.addSubview(titleLb!)
        
        subTitle = UILabel()
        self.addSubview(subTitle!)
        
        btn = UIButton()
        self.addSubview(btn!)
    }
    
    func layoutFrame() {
        let xWidth:CGFloat = self.frame.size.width
        let yHeight:CGFloat = self.frame.size.height / 3 * 2
        
        bgImgView?.frame = CGRect(x: 0, y: 0, width: xWidth, height: self.frame.size.height)
        titleLb?.frame = CGRect(x: 0, y: 0, width: xWidth, height: yHeight)
        subTitle?.frame = CGRect(x: 0, y: yHeight, width: xWidth, height: self.frame.size.height - yHeight)
        btn?.frame = CGRect(x: 0, y: 0, width: xWidth, height: self.frame.size.height)
    }
    

}
