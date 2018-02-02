# - addSubview 계층 구조

지금까지 공부한것들을 추가적으로 계속 실습하면서 addSubview를 통하여<br> 
view.frame.size.width 혹은 view.frame.size.height 를 공부하였다.

# - cocoa touch

새로운 파일을 생성하여 그 안에서 또다른 UIView를 만들어 좀 더 객체 지향적으로 활용하였다.


## 실습


```
//
//  MyCustomView.swift
//  18_02_02
//
//  Created by 배지호 on 2018. 2. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    
    var testLb: UILabel!
    var imgTestView: UIImageView!
    
    var button: UIButton!
    
    var title: String! {
        get {
            return testLb.text!
        }
        set {
            testLb.text! = newValue!
        }
    }
    
    var index: Int = 0 {
        didSet {
            button.tag = index
        }
    }
    
    var imgAdd: UIImage? {
        get {
            return imgTestView.image
        }
        set {
            imgTestView.image = newValue
        }
    }
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
        layoutFrameView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createView() {
        
        imgTestView = UIImageView()
        self.addSubview(imgTestView)
        
        testLb = UILabel()
        testLb.backgroundColor = UIColor.clear
        testLb.textColor = UIColor.white
        testLb.textAlignment = NSTextAlignment.center
        testLb.font = UIFont(name: "Symbol", size: 30)
        self.addSubview(testLb)
        
        
        button = UIButton(type: .custom)
        
        button.setTitleColor(UIColor.brown, for: .normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        
        
        self.addSubview(button)
    }
    
    func layoutFrameView() {
        
        imgTestView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        testLb.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        button.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        button.addTarget(target, action: action, for: controlEvents)
        
    }
    
    
    
    
}

```

<img width="283" alt="default" src="https://user-images.githubusercontent.com/35207193/35735623-c5b7fd7a-0868-11e8-9731-6113308c639e.png">



