//
//  ViewController.swift
//  ToolBox
//
//  Created by 배지호 on 2018. 1. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inchCalculator = Inch()
    var centimiterCalculator = Centimiter()
    var dataKbTransCalculator = DataKb()
    var dataMbTrinsCalculator = DataMb()
    var changeTimeCalculator = ChangeTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSize()
        changeData()
        changeTimeValue()
    }
    
    func changeSize() {
        let result = inchCalculator.changeInch(Inch: 3.4)
        let result2 = centimiterCalculator.changeCm(Cm: 5)
        
        print("ChangeCm : \(result)")
        print("ChangeInch : \(result2)")
    }
    
    func changeData() {
        let result = dataKbTransCalculator.changeDataKb(kb: 10000)
        let result2 = dataMbTrinsCalculator.changDataMb(mb: 100)
        
        print("ChangeMb : \(result)")
        print("ChangeKb : \(result2)")
    }
    
    func changeTimeValue() {
        let result = changeTimeCalculator.changeToSecond(from: 101010)
        
        print("ChangeTime : \(result)")
    }
}

