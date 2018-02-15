//
//  newController.swift
//  18_02_11_Study
//
//  Created by 배지호 on 2018. 2. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class newController: UIViewController {
    
    var backgroundView: UIView?
    var backgroundImg: UIImageView?
    var cardImg: UIImageView?
    var cardImg2: UIImageView?
    var btn: UIButton?
    var index: Int = 0 {
        didSet {
            btn?.tag = index
        }
    }
    var selectBtn: UIButton?
    var card: [UIImageView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundV()
        createView()
        addCard()
    }
    
    func backgroundV() {
        backgroundImg = UIImageView(frame: view.bounds)
        backgroundImg?.image = UIImage(named: "caesars-palace-blackjack.jpg")
        self.view.addSubview(backgroundImg!)

        backgroundView = UIView()
        backgroundView?.frame = view.bounds
        backgroundView?.backgroundColor = UIColor.black
        backgroundView?.alpha = 0.5
        self.view.addSubview(backgroundView!)
    }
    
    func addCard() {
        selectBtn = UIButton()
        selectBtn?.frame = CGRect(x: view.frame.size.width / 3, y: view.frame.size.height / 9 * 7, width: 100, height: 50)
        selectBtn?.setTitle("카드 받기", for: .normal)
        selectBtn?.addTarget(self, action: #selector(addBtnAction(_:)), for: .touchUpInside)
        self.view.addSubview(selectBtn!)
    }
    
    func createView() {
        
        cardImg = UIImageView()
        cardImg?.image = UIImage(named: "./cards/back.png")
        cardImg?.frame = CGRect(x: 30, y: 100, width: 70, height: 100)
        cardImg?.isUserInteractionEnabled = true
        view.addSubview(cardImg!)
        
        cardImg2 = UIImageView()
        cardImg2?.image = UIImage(named: "./cards/back.png")
        cardImg2?.frame = CGRect(x: 30 + (cardImg?.frame.size.width)!, y: 100, width: 70, height: 100)
        cardImg2?.isUserInteractionEnabled = true
        view.addSubview(cardImg2!)
        
        btn = UIButton()
        btn?.frame = cardImg!.bounds
        btn?.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        cardImg?.addSubview(btn!)
        
        btn2 = UIButton()
        btn2?.frame = cardImg2!.bounds
        btn2?.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        cardImg2?.addSubview(btn2!)
        
    }
//    ace_of_hearts
    func cardHeart() {
        var count = Int(arc4random_uniform(4))
//        switch count {
//        case 0:
//            return 
//        default:
//            <#code#>
//        }
    }
    
    @objc func addBtnAction(_ sender:UIButton) {
        var count = Int(arc4random_uniform(4))
        if count == 1 {
            var cdIndex = UIImageView()
            
            cdIndex.image = UIImage(named: "2_of_clubs")
            let x: CGFloat = CGFloat(count % 2)
            let y: CGFloat = CGFloat(count / 2)
            let margin: CGFloat = 50
            
            cdIndex.frame = CGRect(x: (margin * (x + 1)) + (110 * x), y: (margin * (y + 1)) + (120 * y), width: 70, height: 100)
            cdIndex.isUserInteractionEnabled = true
            self.view.addSubview(cdIndex)
            
        }
        
    }
    
    @objc func btnAction(_ sender:UIButton) {
        cardImg!.image = UIImage(named: "./cards/2_of_clubs.png")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
