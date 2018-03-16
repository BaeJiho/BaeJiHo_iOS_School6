//
//  ViewController.swift
//  CocoapodsSample
//
//  Created by 배지호 on 2018. 3. 16..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
//
//    var nameLabel: UILabel = {
//        let nameLabel = UILabel()
//        nameLabel.text = "my name"
//        return nameLabel
//    }()
//
//    var nameLabelThen = UILabel().then {
//        $0.text = "my name"
//        $0.textColor = .blue
//        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
//    }
//
    lazy var imageView = UIImageView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "https://www.google.co.kr/search?q=%EC%82%AC%EC%A7%84&dcr=0&source=lnms&tbm=isch&sa=X&ved=0ahUKEwj_6fXrpfDZAhVMG5QKHXllDhAQ_AUICigB&biw=1549&bih=853#imgrc=55UInlGfUtftQM:"
        
        let url = URL(string: str)!
        Alamofire.request(url).responseData { (dataResponse) in
            if dataResponse.error
        }
    }
}

