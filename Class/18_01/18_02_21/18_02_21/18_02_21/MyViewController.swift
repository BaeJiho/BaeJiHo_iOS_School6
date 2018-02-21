//
//  MyViewController.swift
//  18_02_21
//
//  Created by 배지호 on 2018. 2. 21..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    var bg: UIView!
    var textLabel: UILabel?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bg = UIView(frame: self.view.bounds)
        bg.backgroundColor = .white
        view.addSubview(bg!)
        textLabel = UILabel(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        textLabel?.textColor = .black
        textLabel?.text = text
        bg.addSubview(textLabel!)
    }
}
