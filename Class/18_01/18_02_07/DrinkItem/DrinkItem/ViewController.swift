//
//  ViewController.swift
//  DrinkItem
//
//  Created by 배지호 on 2018. 2. 7..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //프로퍼티
    var item: CustomItem!
    var resultDisplay: UILabel?
    var resultMoney: UILabel?
    var result: ResultButton!
    var itemMoney: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemView(4)
        printDisplay()
        resultView(3)
    }
    
    // UIItem
    func itemView(_ itemCount: Int) {
        for index in 0..<itemCount {
            
            let x: CGFloat = CGFloat(index % 2)
            let y: CGFloat = CGFloat(index / 2)
            let margin: CGFloat = 50
            
            let item = CustomItem(frame: CGRect(x: (margin * (x + 1)) + (110 * x), y: (margin * (y + 1)) + (120 * y), width: 150, height: 150))
            
            if index == 0 {
                item.itemCashTitle = "1000원"
                item.itemImgChang = UIImage(named: "콜라")!
            }else if index == 1 {
                item.itemCashTitle = "800원"
                item.itemImgChang = UIImage(named: "사이다")!
            }else if index == 2 {
                item.itemCashTitle = "1500원"
                item.itemImgChang = UIImage(named: "칸타타")!
            }else {
                item.itemCashTitle = "500원"
                item.itemImgChang = UIImage(named: "삼다수")!
            }
            item.index = index
            item.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            view.addSubview(item)
        }
        
    }
    
    // MoneyDisplay
    func printDisplay() {
        
        resultDisplay = UILabel(frame: CGRect(x: 50, y: view.frame.size.height / 8 * 5, width: view.frame.size.width - 100, height: view.frame.size.height / 8 * 1))
        resultDisplay?.backgroundColor = UIColor.black
        resultDisplay?.textColor = UIColor.white
        resultDisplay?.text = "결과"
        resultDisplay?.textAlignment = .right
        resultDisplay?.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(resultDisplay!)
        
        resultMoney = UILabel(frame: CGRect(x: 50, y: view.frame.size.height / 8 * 6, width: view.frame.size.width - 100, height: view.frame.size.height / 8 * 1))
        resultMoney?.backgroundColor = UIColor.black
        resultMoney?.textColor = UIColor.white
        resultMoney?.text = "잔액"
        resultMoney?.textAlignment = .right
        resultMoney?.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(resultMoney!)
    }
    
    // input Button
    func resultView(_ resultButtonCount: Int) {
        for index in 0..<resultButtonCount {
            let x: CGFloat = CGFloat(index % 3)
            let margin: CGFloat = 50
            
            let result = ResultButton(frame: CGRect(x: (margin * (x + 1)) + (68 * x), y: view.frame.size.height / 9 * 8, width: 80, height: 50))
            result.addTarget(self, action: #selector(resultBtnAction(_:)), for: .touchUpInside)
            result.index = index
            
            if index == 0 {
                result.NameTitle = "1000원"
            }else if index == 1 {
                result.NameTitle = "500원"
            }else {
                result.NameTitle = "반환"
            }
            
            view.addSubview(result)
        }
    }
    
    // ButtonAction
    @objc func resultBtnAction(_ sender: UIButton) {
        if let money: Int = sender.tag {
            if money == 0 {
                itemMoney += 1000
                resultDisplay?.text = "1000원이 입금되었습니다."
                resultMoney?.text = "\(itemMoney)원"
            }else if money == 1 {
                itemMoney += 500
                resultDisplay?.text = "500원이 입금되었습니다."
                resultMoney?.text = "\(itemMoney)원"
            }else {
                resultDisplay?.text = "\(itemMoney)가 반환되었습니다."
                itemMoney = 0
                resultMoney?.text = "잔액\(itemMoney)원"
            }
        }
    }
    
    
    @objc func btnAction(_ sender: UIButton) {
        if let result: Int = sender.tag {
            
            if result == 0 {
                if itemMoney >= 1000 {
                    resultDisplay?.text = "콜라가 나왔습니다."
                    itemMoney = itemMoney - 1000
                    resultMoney?.text = "\(itemMoney)원이 남았습니다."
                }else {
                    resultMoney?.text = "잔액이 부족합니다."
                }
            }else if result == 1 {
                if itemMoney >= 800 {
                    resultDisplay?.text = "사이다가 나왔습니다."
                    itemMoney = itemMoney - 800
                    resultMoney?.text = "\(itemMoney)원이 남았습니다."
                }else {
                    resultMoney?.text = "잔액이 부족합니다."
                }
            }else if result == 2 {
                if itemMoney >= 1500 {
                    resultDisplay?.text = "커피가 나왔습니다."
                    itemMoney = itemMoney - 1500
                    resultMoney?.text = "\(itemMoney)원이 남았습니다."
                }else {
                    resultMoney?.text = "잔액이 부족합니다."
                }
            }else if result == 3 {
                if itemMoney >= 500 {
                    resultDisplay?.text = "물이 나왔습니다."
                    itemMoney = itemMoney - 500
                    resultMoney?.text = "\(itemMoney)원이 남았습니다."
                }else {
                    resultMoney?.text = "잔액이 부족합니다."
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

