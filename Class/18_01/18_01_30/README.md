# - UILabel

텍스트를 표현할때 사용하는 타입이며, 다른  UI 타입들과 마찬가지로 새로운 변수에 인스턴스를 생성하여 사용한다.<br>
아래의 코드는 UILael에 쓰이는 예이다.


```
let newLb = UILabel(frame: CGRect(x: 0, y: 0, width: 100,height: 30))
newLb.text = "테스트" 
newLb.textColor = UIColor.gray
newLb.textAlignment = NSTextAlignment.center
newLb.font = UIFont.systemFont(ofSize: 10)

```


# - UIControl

UIControl이란 <br>
사용자 인터렉션에 의한 응답에 대해 특별한 액션을 줄수 있게 설정하는 클래스이다.

```
public static var normal: UIControlState { get }
public static var highlighted: UIControlState { get }
public static var disabled: UIControlState { get }
public static var selected: UIControlState { get }
open var isEnabled: Bool
open var isSelected: Bool
open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)

```

이중에서 addTarget을 확실히 알아야하며, addTarget이란

타겟에 Self를 사용하여, action의 주소값을 지정하고 지정한 action을 실행하는 것이다.

# - UIButton

UIButton이란 사용자의 이벤트를 받아 처리해주는 UI버튼이다.<br>

구조 : Title, Image, backgroundImage

<img width="500" alt="uibutton" src="https://user-images.githubusercontent.com/35207193/35571723-48910a8e-0616-11e8-8561-1247dc9eaee0.png">


```
let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
btn.titleLabel?.text = "버튼" 
btn.setBackgroundImage(UIImage(named:"bg1.png"), for: UIControlState.normal)
btn.setTitleColor(.green, for: .normal)
btn.addTarget(self, action:#selector(ViewController.btnAction(sender:)),for: .touchUpInside)
self.view.addSubview(btn)

```

### 중요사항!

ViewController파일에 btnAction 메소드가 존재 해야한다.<br>
func btnAction(sender:UIButton) { <br>
//버튼 이벤트시 액션<br>
}


# - 실습

앞서했던 계산기를 오늘 배운 UILabel, UIControl, UIButton을 추가로 좀 더 짜임새 있게 적어보았다.

```

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
    
    var strNum: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        Layout()
        
        
    }

    
    
    
    func createUI() {
        
        //main 영역
        displayView = UILabel()
        displayView.backgroundColor = UIColor.darkGray
        displayView.text = "0"
        
        displayView.textAlignment = NSTextAlignment.right
        view.addSubview(displayView)
        keyPadView = UIView()
        keyPadView.backgroundColor = UIColor.black
        view.addSubview(keyPadView)
        
        // keyPad 영역
        etcView = UIView()
        keyPadView.addSubview(etcView)
        operView = UIView()
        keyPadView.addSubview(operView)
        numberView = UIView()
        keyPadView.addSubview(numberView)
        
        etcBtn = makeFrameList(listCount: 3)
        let etcTitleList = ["C","+/-","%"]
        for index in 0..<etcBtn.count {
            
            let title = etcTitleList[index]
            let btn = etcBtn[index]
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.brown.cgColor
            btn.addTarget(self, action: #selector(self.decHandler(_:)), for: .touchUpInside)
            btn.setTitle(title, for: .normal)
            etcView.addSubview(btn)
        }
        
        operBtn = makeFrameList(listCount: 5)
        let operTitleList = ["/","X","+","-","="]
        for index in 0..<operBtn.count{
            let title = operTitleList[index]
            let btn = operBtn[index]
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.brown.cgColor
            btn.addTarget(self, action: #selector(self.operHandler(_:)), for: .touchUpInside)
            btn.setTitle(title, for: .normal)
            operView.addSubview(btn)
        }
        
        numberBtn = makeFrameList(listCount: 10)
        let numTitle = ["7","8","9","4","5","6","1","2","3","0"]
        for index in 0..<numberBtn.count {
            let title = numTitle[index]
            let btn = numberBtn[index]
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.brown.cgColor
            btn.addTarget(self, action: #selector(self.numHandler(_:)), for: .touchUpInside)
            btn.setTitle(title, for: .normal)
            numberView.addSubview(btn)
        }
        
    }
    
    @objc func decHandler(_ sender:UIButton) {
        print(sender.tag)
        print(sender.titleLabel?.text)
    }
    
    @objc func operHandler(_ sender:UIButton) {
        print(sender.tag)
        print(sender.titleLabel?.text)
    }
    
    @objc func numHandler(_ sender:UIButton) {
        print(sender.tag)
        print(sender.titleLabel?.text)
        strNum += (sender.titleLabel?.text)!
        displayView.text! += strNum
    }
    
    
    
    //UIButtonn 만드는 부분
    func makeFrameList(listCount: Int) -> [UIButton] {
        var result: [UIButton] = []
        
        for index in 0..<listCount {
            let btn: UIButton = UIButton()
            btn.tag = index
            result.append(btn)
        }
        return result
    }
    
    func Layout() {
        
        let btnWidth: CGFloat = self.view.frame.size.width / 4
        var offSetY = self.view.frame.size.height - (btnWidth * 5)
        
        keyPadView.frame = CGRect(x: 0, y: offSetY, width: view.frame.size.width, height: btnWidth * 5)
        etcView.frame = CGRect(x: 0, y: 0, width: btnWidth * 3, height: btnWidth)
        operView.frame = CGRect(x: btnWidth * 3, y: 0, width: btnWidth, height: btnWidth * 5)
        numberView.frame = CGRect(x: 0, y: btnWidth, width: btnWidth * 3, height: btnWidth * 4)
        let displayHeigth:CGFloat = 150
        offSetY -= displayHeigth
        
        displayView.frame = CGRect(x: 0, y: offSetY, width: view.frame.size.width, height: displayHeigth)
        
        average(list: etcBtn, countLine: 3, width: btnWidth)
        average(list: operBtn, countLine: 1, width: btnWidth)
        average(list: numberBtn, countLine: 3, width: btnWidth)
        
    }
    
    func average(list:[UIView], countLine: Int, width:CGFloat) {
        for index in 0..<list.count{
            var col:CGFloat = CGFloat(index % countLine)
            var row:CGFloat = CGFloat(index / countLine)
            
            list[index].frame = CGRect(x: col * width, y: row * width , width: width , height: width)
        }
    }
    
    

}


```


# 공부하며 느낀점

함수 밖 저장프로퍼티를 사용하면 클래스 안에있는 모든 메서드에서 호출하여 사용 가능하며, 함수 안에서 선언된 변수는 함수가 끝나면 사라지는 그 관계를 좀 더 확실히 알아야겠다. 그로 인하여, 엄청나게 길었던 코드가 눈에 띄게 줄어드는것을 보았고 추가로 좀 더 유지보수가 편리해짐을 경험하였다. UIButton에서 addTarget을 사용하여 @objc 함수를 사용해야하는것도 다시 한번 공부해봐야 할 것 같다.

