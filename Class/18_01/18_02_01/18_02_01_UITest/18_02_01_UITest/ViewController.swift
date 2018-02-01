//
//  ViewController.swift
//  18_02_01_UITest
//
//  Created by 배지호 on 2018. 2. 1..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedBtn: UIButton?
    var selectedBtnArray: [UIButton]!
    var centerTextLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImage: UIImage = UIImage(named: "bg")!

        let bgImageView: UIImageView = UIImageView(frame: view.bounds)
        bgImageView.image = bgImage
        bgImageView.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(bgImageView)


        let sunImg: UIImage? = UIImage(named: "123.jpg")

        let sunImgView: UIImageView = UIImageView(frame: view.bounds)
        sunImgView.image = sunImg
        sunImgView.alpha = 0.5
        sunImgView.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(sunImgView)


        let coverView: UIView = UIView(frame: bgImageView.bounds)
        coverView.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        coverView.alpha = 0.9
        bgImageView.addSubview(coverView)

        //레이블
        let titleLb: UILabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150))
        titleLb.text = "UI Test View"
        titleLb.textColor = UIColor.darkGray
        titleLb.font = UIFont.systemFont(ofSize: 45)
        titleLb.textAlignment = .center
        view.addSubview(titleLb)

        centerTextLb = UILabel(frame: CGRect(x: 0, y: view.frame.size.height / 2 - 75, width: view.frame.size.width, height: 150))
        centerTextLb.text =
        """
        중간에 표시되는 텍스트
        오~
        쏠~~~~~~~~레~미~...오~~
        """
        centerTextLb.font = UIFont.systemFont(ofSize: 20)
        centerTextLb.textColor = UIColor.brown
        centerTextLb.numberOfLines = 0
        centerTextLb.lineBreakMode = .byWordWrapping
        centerTextLb.textAlignment = .left
        view.addSubview(centerTextLb)

//        let logoBtn: UIButton = UIButton(type: .custom)
//        logoBtn.frame = CGRect(x: 25, y: 45, width: 45, height: 45)
//        logoBtn.tag = 1
////        logoBtn.setImage(#imageLiteral(resourceName: "b0034105_4d9e7c6f45901.png"), for: .normal)
//        logoBtn.setTitle("소녀시대", for: .normal)
//        logoBtn.setTitleColor(.blue, for: .normal)
//        logoBtn.setTitleColor(.red, for: .selected)
//        logoBtn.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
//        view.addSubview(logoBtn)
//
//        let logoBtn2: UIButton = UIButton(type: .custom)
//        logoBtn2.frame = CGRect(x: 80, y: 45, width: 45, height: 45)
//        logoBtn.tag = 2
////        logoBtn2.setImage(#imageLiteral(resourceName: "b0034105_4d9e7c6f45901.png"), for: .normal)
//        logoBtn2.setTitleColor(.blue, for: .normal)
//        logoBtn2.isSelected = true
////        selectedBtn = logoBtn2
//        logoBtn2.setTitle("소년시대", for: .normal)
//        logoBtn2.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
//        view.addSubview(logoBtn2)

        let btnOne: UIButton = UIButton(type: .custom)
        btnOne.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 45)
        btnOne.setTitle("하나", for: .normal)
        btnOne.setTitleColor(.blue, for: .normal)
        btnOne.setTitleColor(.red, for: .selected)
        btnOne.backgroundColor = UIColor.white
        btnOne.tag = 1
        btnOne.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
        view.addSubview(btnOne)

        let btnTwo: UIButton = UIButton(type: .custom)
        btnTwo.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: 45)
        btnTwo.setTitle("두울", for: .normal)
        btnTwo.setTitleColor(.blue, for: .normal)
        btnTwo.setTitleColor(.red, for: .selected)
        btnTwo.backgroundColor = UIColor.white
        btnTwo.tag = 2
        btnTwo.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
        view.addSubview(btnTwo)

        let btnThree: UIButton = UIButton(type: .custom)
        btnThree.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 45)
        btnThree.setTitle("세엣", for: .normal)
        btnThree.setTitleColor(.blue, for: .normal)
        btnThree.setTitleColor(.red, for: .selected)
        btnThree.backgroundColor = UIColor.white
        btnThree.tag = 3
        btnThree.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
        view.addSubview(btnThree)

//
        let btnResult: UIButton = UIButton(type: .custom)
        btnResult.frame = CGRect(x: 0, y: 160, width: 400, height: 45)
        btnResult.setTitle("결과", for: .normal)
        btnResult.setTitleColor(.blue, for: .normal)
        btnResult.setTitleColor(.red, for: .selected)
        btnResult.backgroundColor = UIColor.white
        btnResult.addTarget(self, action: #selector(resultBtn(_:)), for: .touchUpInside)
        view.addSubview(btnResult)

    }
    
    @objc func logoAction(_ sender: UIButton) {

//        if sender.isSelected == false {
//            selectedBtn = sender
//            sender.isSelected = true
//            if sender.isSelected == true {
//                selectedBtnArray.append(selectedBtn!)
//            }
//
//        }else {
//            sender.isSelected = false
//            let index: Int = selectedBtnArray.index(of: sender)!
//            selectedBtnArray.remove(at: index)
//        }
        if sender.isSelected == false {
            sender.isSelected = true
            selectedBtn?.isSelected = false
            selectedBtn = sender

        }
        print("touch")
    }
    @objc func resultBtn(_ sender: UIButton) {
        guard let resultBtn = selectedBtn else { return }
        centerTextLb.text = String(describing: resultBtn)
    }

}

