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
    var btn: UIButton?
    var selectBtn: UIButton?
    var endBtn: UIButton?
    var score: Int = 0
    var count: Int = 0
    var dealerScore: Int = 0
    
    var cardList1: [UIImageView] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundV()
        addCard()
        card()
        dealer()
//        endCard()
        
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
        selectBtn?.setTitleColor(UIColor.blue, for: .highlighted)
        selectBtn?.addTarget(self, action: #selector(addBtnAction(_:)), for: .touchUpInside)
        self.view.addSubview(selectBtn!)
        
        endBtn = UIButton()
        endBtn?.frame = CGRect(x: view.frame.size.width / 5, y: view.frame.size.height / 9 * 8, width: 200, height: 50)
        endBtn?.setTitle("딜러 점수와 비교하기", for: .normal)
        endBtn?.setTitleColor(UIColor.blue, for: .highlighted)
        endBtn?.addTarget(self, action: #selector(endBtnAction(_:)), for: .touchUpInside)
        self.view.addSubview(endBtn!)
    }
    
    
    func card() {
        for index in 0..<52 {
            let x = index / 13
            let y = index % 13
            
            if x == 0 {
                cardList1.append(UIImageView.init(image: UIImage(named: "./cards/\(y + 1).png")!))
                cardList1[cardList1.count - 1].tag = y + 1
            } else if x == 1 {
                cardList1.append(UIImageView.init(image: UIImage(named: "./card_dia/\(y + 1).png")!))
                cardList1[cardList1.count - 1].tag = y + 1
            } else if x == 2 {
                cardList1.append(UIImageView.init(image: UIImage(named: "./card_heart/\(y + 1).png")!))
                cardList1[cardList1.count - 1].tag = y + 1
            } else if x == 3 {
                cardList1.append(UIImageView.init(image: UIImage(named: "./card_spades/\(y + 1).png")!))
                cardList1[cardList1.count - 1].tag = y + 1
            }
        }
    }
    
    func dealer() {
        let randomNum:Int = Int(arc4random_uniform(5))
        dealerScore = randomNum + 17
        print("딜러 스코어\(dealerScore)")
    }
    
    @objc func endBtnAction(_ sender:UIButton) {
        if dealerScore > score {
            let alertAC = UIAlertController(title: "확인", message:
                """
                내점수:\(score)점 딜러점수: \(dealerScore)점
                \(dealerScore - score)점 차이로 패배하였습니다.
                다시하시겠습니까?
                """, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
            let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
            alertAC.addAction(action1)
            alertAC.addAction(action2)
            self.present(alertAC, animated: true, completion: nil)
        } else if dealerScore == score {
            let alertAC = UIAlertController(title: "확인", message:
                """
                내점수:\(score)점 딜러점수: \(dealerScore)점
                으로 비겼습니다.
                다시하시겠습니까?
                """, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
            let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
            alertAC.addAction(action1)
            alertAC.addAction(action2)
            self.present(alertAC, animated: true, completion: nil)
        } else if (dealerScore < score) && (score < 22) {
            let alertAC = UIAlertController(title: "확인", message:
                """
                내점수:\(score)점 딜러점수: \(dealerScore)점
                \(score - dealerScore)점 차이로 승리하였습니다.
                다시하시겠습니까?
                """, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
            let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
            alertAC.addAction(action1)
            alertAC.addAction(action2)
            self.present(alertAC, animated: true, completion: nil)
        }
    }
    
    @objc func addBtnAction(_ sender:UIButton) {
        count = count + 1
        for index in count - 1..<count {
            let x: CGFloat = CGFloat(index % 4)
            let y: CGFloat = CGFloat(index / 4)
            let margin: CGFloat = 80
            
            cardImg = UIImageView()
            cardImg?.image = UIImage(named: "./cards/back.png")
            cardImg?.frame = CGRect(x: (30 + (80 * x)), y: (margin + (120 * y)), width: 70, height: 100)
            cardImg?.isUserInteractionEnabled = true
            self.view.addSubview(cardImg!)
            
            btn = UIButton()
            btn?.frame = cardImg!.bounds
            btn?.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            btn?.tag = count
            cardImg?.addSubview(btn!)
            
            print("엑스 값 : \(x)")
            print("와이 값 : \(y)")
            print(btn?.tag)
            print("============")
            
        }
    }
    
    @objc func btnAction(_ sender:UIButton) {
        if let name = btn?.tag {
            if cardList1.count == 0 {
                let alertAC = UIAlertController(title: "확인", message: "더이상 카드가 없습니다.", preferredStyle: .actionSheet)
                let action1 = UIAlertAction(title: "네", style: .default, handler: nil)
                alertAC.addAction(action1)
                self.present(alertAC, animated: true, completion: nil)
                return
            }
            print(name)
            let randomIndex = Int(arc4random_uniform(UInt32(cardList1.count)))
            
            switch cardList1[randomIndex].tag {
            case 1:
                let alertAC = UIAlertController(title: "확인", message: "11점으로 바꾸시겠습니까?(기본값은 1점입니다.)", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                    self.score += 11
                    print("내 카드 점수 \(self.score)")
                    if self.score > 21 {
                        let alertAC = UIAlertController(title: "확인", message: "21점이 넘어 자동 패배하였습니다. 다시하시겠습니까?", preferredStyle: .alert)
                        let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                            self.navigationController?.popViewController(animated: true)
                        })
                        let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
                        alertAC.addAction(action1)
                        alertAC.addAction(action2)
                        self.present(alertAC, animated: true, completion: nil)
                    }
                })
                let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: { (action) in
                    self.score += 1
                    print("내 카드 점수 \(self.score)")
                    if self.score > 21 {
                        let alertAC = UIAlertController(title: "확인", message: "21점이 넘어 자동 패배하였습니다. 다시하시겠습니까?", preferredStyle: .alert)
                        let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                            self.navigationController?.popViewController(animated: true)
                        })
                        let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
                        alertAC.addAction(action1)
                        alertAC.addAction(action2)
                        self.present(alertAC, animated: true, completion: nil)
                    }
                })
                alertAC.addAction(action1)
                alertAC.addAction(action2)
                self.present(alertAC, animated: true, completion: nil)
                
            case 11,12,13:
                score += 10
                print("내 카드 점수 \(self.score)")
                
                if self.score > 21 {
                    let alertAC = UIAlertController(title: "확인", message: "21점이 넘어 자동 패배하였습니다. 다시하시겠습니까?", preferredStyle: .alert)
                    let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    })
                    let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
                    alertAC.addAction(action1)
                    alertAC.addAction(action2)
                    self.present(alertAC, animated: true, completion: nil)
                }
            default:
                score += cardList1[randomIndex].tag
                print("내 카드 점수 \(self.score)")
                
                if self.score > 21 {
                    let alertAC = UIAlertController(title: "확인", message: "21점이 넘어 자동 패배하였습니다. 다시하시겠습니까?", preferredStyle: .alert)
                    let action1 = UIAlertAction(title: "네", style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    })
                    let action2 = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
                    alertAC.addAction(action1)
                    alertAC.addAction(action2)
                    self.present(alertAC, animated: true, completion: nil)
                }
            }
            cardList1[randomIndex].frame = (cardImg?.bounds)!
            cardImg!.addSubview(cardList1[randomIndex])
            cardList1.remove(at: randomIndex)
            print("남은 숫자 : \(cardList1.count)")
            
            
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
