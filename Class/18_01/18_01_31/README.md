# - 복습

![1](https://user-images.githubusercontent.com/35207193/35628631-e0f24544-06df-11e8-9078-7f38a319f93f.gif)

그동안 배워왔던 구조체와 클래스, 조건문, 프로퍼티(저장 프로퍼티, 연산 프로퍼티), UI Type들을 조합하여<br>
이전에 실습하였던 Calculator를 storyboard가 아닌 viewController에서 코드로 만들어보았다.<br>
29일 30일에 공부했던 UIView와 UILabel & UIControl & UIButton 를 활용하였으며, 강사님이 진행하신 코드를 분석한 이후에<br> 다시 새롭게 짜보았다.

```
//
//  ViewController.swift
//  18_01_31_TestUI
//
//  Created by 배지호 on 2018. 1. 31..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayView: UILabel!
    var keyPadView: UIView!
    
    var etcView: UIView!
    var operView: UIView!
    var numberView: UIView!
    
    var etcBtn: [UIButton]!
    var operBtn: [UIButton]!
    var numberBtn: [UIButton]!
    
    var strNumber: String = ""
    var strNumberTwo: String = ""
    
    var number: Int = 0
    var numberTwo: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiMain()
        layout()
        
    }
    
    
    func uiMain() {
        displayView = UILabel()
        displayView.backgroundColor = UIColor.brown
        displayView.text = "0"
        displayView.textAlignment = NSTextAlignment.right
        displayView.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(displayView)
        
        keyPadView = UIView()
        keyPadView.backgroundColor = UIColor.darkGray
        view.addSubview(keyPadView)
        
        etcView = UIView()
        keyPadView.addSubview(etcView)
        
        operView = UIView()
        keyPadView.addSubview(operView)
        
        numberView = UIView()
        keyPadView.addSubview(numberView)
        
        //etc버튼 생성
        etcBtn = btnList(count: 3)
        let etcText: [String] = ["C","&","@"]
        for index in 0..<etcBtn.count {
            let title = etcText[index]
            let btnList = etcBtn[index]
            btnList.layer.borderColor = UIColor.black.cgColor
            btnList.layer.borderWidth = 1
            btnList.setTitle(title, for: .normal)
            btnList.addTarget(self, action: #selector(etcAction(sender:)), for: .touchUpInside)
            etcView.addSubview(btnList)
        }
        
        //oper버튼 생성
        operBtn = btnList(count: 5)
        let operText: [String] = ["+","-","%","/","="]
        for index in 0..<operBtn.count {
            let title = operText[index]
            let operBtnList = operBtn[index]
            operBtnList.layer.borderColor = UIColor.black.cgColor
            operBtnList.layer.borderWidth = 1
            operBtnList.setTitle(title, for: .normal)
            operBtnList.addTarget(self, action: #selector(operAction(sender:)), for: .touchUpInside)
            operView.addSubview(operBtnList)
        }
        //숫자 버튼 생성
        numberBtn = btnList(count: 10)
        let numberText: [String] = ["7","8","9","4","5","6","1","2","3","0"]
        for index in 0..<numberBtn.count {
            let title = numberText[index]
            let numberBtnList = numberBtn[index]
            numberBtnList.layer.borderColor = UIColor.black.cgColor
            numberBtnList.layer.borderWidth = 1
            
            numberBtnList.setTitle(title, for: .normal)
            numberBtnList.addTarget(self, action: #selector(ViewController.numberAction(sender:)), for: .touchUpInside)
            numberView.addSubview(numberBtnList)
        }
        
    }
    // etc 액션 버튼 부분
    @objc func etcAction(sender: UIButton) {
        if let result = sender.titleLabel?.text {
            print(result)
        }
    }
    
    //오퍼 버튼 액션 부분
    @objc func operAction(sender: UIButton) {
        if let result = sender.titleLabel?.text {
            
            print(result)
        }
    }
    
    //숫자 버튼 액션 부분
    @objc func numberAction(sender: UIButton) {
        if let result = sender.titleLabel?.text {
            strNumber += result
            displayView.text = strNumber
        }
        print(strNumber)
    }
    
    
    
    func strChangeValue(num: String) -> Int {
        if num.count == 0 {
            number = Int(strNumber)!
        }
        return number
    }
    
    
    //각 버튼을 만드는 함수
    func btnList(count: Int) -> [UIButton] {
        var result: [UIButton] = []
        for index in 0..<count {
            let list = UIButton()
            list.backgroundColor = UIColor.darkGray
            list.tag = index
            result.append(list)
        }
        return result
    }
    
    
    func layout() {
        
        let widthSize: CGFloat = self.view.frame.size.width / 4
        let setY: CGFloat = self.view.frame.size.height - (widthSize * 5)
        
        keyPadView.frame = CGRect(x: 0, y: setY, width: view.frame.size.width , height: widthSize * 5)
        
        etcView.frame = CGRect(x: 0, y: 0, width: widthSize * 3, height: widthSize)
        operView.frame = CGRect(x: widthSize * 3, y: 0, width: widthSize, height: widthSize * 5)
        numberView.frame = CGRect(x: 0, y: widthSize, width: widthSize * 3, height: widthSize * 4)
        
        
        displayView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: setY)
        
        //각 버튼들의 프레임을 레이아웃에 실행
        btnCount(list: numberBtn, count: 3, size: widthSize)
        btnCount(list: etcBtn, count: 3, size: widthSize)
        btnCount(list: operBtn, count: 1, size: widthSize)
        
    }
    //버튼들의 프레임을 만드는 영역
    func btnCount(list: [UIView], count: Int, size: CGFloat) {
        for index in 0..<list.count {
            let x: CGFloat = CGFloat(index % count)
            let y: CGFloat = CGFloat(index / count)
            
            list[index].frame = CGRect(x: x * size, y: y * size, width: size, height: size)
        }
    }


}

```

# 공부하며 느낀점

지금까지 공부한 지식을 조합하여 좀 더 많은 기능을 구현할수 있을 것 같다.<br>
아직 UIButton 과 UIControl의 이해가 부족해서 머리속에 짜놓은 부분을 코드로 구현하기가 부족하다.<br>
사실 storyboard에서 만드는것이 좀 더 편하지만 viewController 내부에서 UIKit Framework를 좀 더 공부하면서 <br> 훨씬 코딩의 매력을 느끼는 중이다.