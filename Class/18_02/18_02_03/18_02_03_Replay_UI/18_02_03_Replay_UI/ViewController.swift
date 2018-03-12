//
//  ViewController.swift
//  18_02_03_Replay_UI
//
//  Created by 배지호 on 2018. 2. 3..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var displayView: UIView!
    var padView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        
        
        let test = CustomView(frame: CGRect(x: 0, y: 0, width: 150, height: 200))
        
        view.addSubview(test)
        
    }
    
    func createView() {
        
    }


}

