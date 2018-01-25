//
//  ViewController.swift
//  calculator
//
//  Created by 배지호 on 2018. 1. 12..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 내가 입력했을때 출력되는 UI부분
    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var resultNumDisplay: UILabel!
    //operationTemp는 출력되는 숫자를 저장하는 문자
    var operationTemp: String = ""
    
    var firstNum: String = "0"
    var secondNum: String = "0"
    var resultNum: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    //MARK: - Action Method
    
    //숫자 버튼 부분
    @IBAction func clickDidNumber(_ sender: UIButton) {
        //버튼에 있는 텍스트 가져오기
        let numberStr = sender.titleLabel!.text!
        //연산자 유무확인
        if operationTemp.count > 0 {
//            let secondDisplay = secondNumDisplay.text
            if secondNum == "0"{
//                secondNumDisplay.text = numberStr
                secondNum = numberStr
            }else{
//                secondNumDisplay.text = secondNumDisplay.text! + numberStr
                secondNum = secondNum + numberStr
            }
            secondNumDisplay.text = secondNum
        }else{
//            let firstDisplay = firstNumDisplay.text
            if firstNum == "0"{
//                firstNumDisplay.text = numberStr
                resetDisplay()
                firstNum = numberStr
            }else{
//                firstNumDisplay.text = firstNumDisplay.text! + numberStr
                firstNum = firstNum + numberStr
            }
            firstNumDisplay.text = firstNum
        }
    }
    
    @IBAction func clickDidOperation(_ sender: UIButton) {
        let operStr = sender.titleLabel!.text!
//        let firstDisplay = firstNumDisplay.text!
        if firstNum != "0"{
            operationTemp = operStr
//            changeColorBy(operation: operStr)
        }
    }
    
    @IBAction func clickDidCancel(_ sender: UIButton) {
        print("didCancel")
        resetData()
        resetDisplay()
        
    }
    
    
    @IBAction func clickDidResult(_ sender: UIButton) {
//        let secondNumStr = secondNumDisplay.text!
        if secondNum != "0" {
            let firstNumTemp: Int = Int(firstNum)!
            let op: String = operationTemp
            let secondNumTemp: Int = Int(secondNum)!
            
            let rere = calculation(fi: firstNumTemp, operation: op, se: secondNumTemp)
            resultNumDisplay.text = String(rere)
            resetData()
        }
    }
    
    //MARK: - Private Method
    
    /// 연산 함수
    /// 두수를 연산자에 따라 연산하고 결과값을 리턴
    /// -Parameters :
    ///  firstNum: 첫번째 디스플레이에 표시된 숫자
    ///  secondNum: 두번째 디스플레이에 표시된 숫자
    ///  operation: 연산을 위한 연산자
    private func calculation(fi: Int, operation: String, se: Int) -> Int{
        
        var resultNum: Int = 0
        
        switch operation {
        case "+":
            print("더하기 연산")
            resultNum = fi + se
        case "−":
            print("빼기 연산")
            resultNum = fi - se
        case "×":
            print("곱하기 연산")
            resultNum = fi * se
        case "÷":
            print("나누기 연산")
            resultNum = fi / se
        default:
            print("Error")
        }
        return resultNum
    }
    //데이터 리셋
    private func resetData(){
        
        firstNum = "0"
        secondNum = "0"
        resultNum = "0"
        operationTemp = ""
    }
    //UI 리셋
    private func resetDisplay(){
        
        firstNumDisplay.text = "0"
        secondNumDisplay.text = "0"
        resultNumDisplay.text = "0"
        
        changeLabelBG(color: .black)
    }
    private func changeColorBy(operation: String){
        
        var color:UIColor
        
        switch operation {
        case "+":
            color = .red
        case "−":
            color = .gray
        case "×":
            color = .darkText
        case "÷":
            color = .orange
        default:
            color = .white
            print("Error")
        }
        changeLabelBG(color: color)
    }
    private func changeLabelBG(color: UIColor){
        firstNumDisplay.backgroundColor = color
        secondNumDisplay.backgroundColor = color
        resultNumDisplay.backgroundColor = color
    }
}
