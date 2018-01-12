# - 계산기를 만들자

먼저 생각해봐야 할 것은 처음누르면 화면에 입력되는 값과 그 다음값을 입력하기전에 연산자를 기입하고 두번째 값을 입력한 다음에 =을 통하여 최종적으로 출력을 해야한다.<br>
그럼 먼저 UI를 잡아보도록하자<br>

<img width="289" alt="2018-01-12 7 37 07" src="https://user-images.githubusercontent.com/35207193/34871835-54dfffcc-f7d2-11e7-8e31-57b55283a7fc.png">

UI를 지정해서 내가 상상한 계산기를 제작하였다.

- 크게 상단에 있는 노출되는 디스플레이 영역<br>
- 숫자를 더할수 있는 연산자<br>
- 입력 할 수 있는 숫자버튼

코드를 짜보았다.

```
import UIKit

class ViewController: UIViewController {

    // 내가 입력했을때 출력되는 UI부분
    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var resultNumDisplay: UILabel!
    // 출력되는 숫자를 저장하는 문자
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
            if secondNum == "0"{
                secondNum = numberStr
            }else{
                secondNum = secondNum + numberStr
            }
            secondNumDisplay.text = secondNum
        }else{
            if firstNum == "0"{
                resetDisplay()
                firstNum = numberStr
            }else{
                firstNum = firstNum + numberStr
            }
            firstNumDisplay.text = firstNum
        }
    }
    
    @IBAction func clickDidOperation(_ sender: UIButton) {
        let operStr = sender.titleLabel!.text!
        if firstNum != "0"{
            operationTemp = operStr
        }
    }
    
    @IBAction func clickDidCancel(_ sender: UIButton) {
        print("didCancel")
        resetData()
        resetDisplay()
        
    }
    
    
    @IBAction func clickDidResult(_ sender: UIButton) {
        if secondNum != "0" {
            let firstNumTemp: Int = Int(firstNum)!
            let op: String = operationTemp
            let secondNumTemp: Int = Int(secondNum)!
            
            let resultNum = calculation(firstNum: firstNumTemp, operation: op, secondNum: secondNumTemp)
            resultNumDisplay.text = String(resultNum)
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
    private func calculation(firstNum: Int, operation: String, secondNum: Int) -> Int{
        
        var resultNum: Int = 0
        
        switch operation {
        case "+":
            print("더하기 연산")
            resultNum = firstNum + secondNum
        case "−":
            print("빼기 연산")
            resultNum = firstNum - secondNum
        case "×":
            print("곱하기 연산")
            resultNum = firstNum * secondNum
        case "÷":
            print("나누기 연산")
            resultNum = firstNum / secondNum
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

```

코드를 나누는 기준은 주석으로 코멘트를 달아놓았으며, 아래는 그 결과이다.

![calculator](https://user-images.githubusercontent.com/35207193/34871741-191d652e-f7d2-11e7-81ed-39caa8d9b7b8.gif)


# - 공부하며 느낀점

계산기 어플을 처음 제작하여 실행해보니 너무나도 즐거웠다.<br>
조금 더 신경써서 사용자에게 편리한 알고리즘으로 계산기를 업그레이드하면 좋을 것 같다.