# - Delegate Pattern



## - Protocol


- 프로토콜은 원하는 작업이나 기능을 구현되도록 메서드, 프로퍼티등으로 요구 사항의 청사진을 정의합니다.<br>
- 클래스, 구조체, 열거형은 프로토콜을 채택하면, 프로토콜에서 요구한 사항에 대해 구현해야 됩니다.<br>
- 프로토콜을 통해 공통적인 작업을 강제 할수 있으며, 해당 프로토콜을 채택한 사람이 구현한 메소드에 대한 정보도 알수 있다.

간단한 Protocol 문법을 알아보자!

```

class Animal: Runable{
var regCount:Int = 0 
func run() {

  } 
}

protocol Runable {
var regCount:Int {get set}
func run() }
```

Protocol 채택 방법!

```
protocol Runable {
var regCount:Int {get set}
func run() 
}

protocol Flying :Runable {
var wingCount:Int {get set} 
}

class Animal: Flying{
var wingCount: Int = 0 var regCount:Int = 0 
func run(){
  } 
}

```

위에 코드를 보면 protocol 타입인 Runable을 protocol 타입의 Flying에 상속하고 Animal에 Flying을 상속하였다.
이렇게 될 경우에 Animal에는 Flying만 상속받았지만, 추가적으로 Runable도 전부 다 같이 구현을 해줘야 조건이 완성된다.

Protocol은 추상클래스로도 사용이 가능하다.


프로토콜을 추상 클래스처럼 사용할수 있다.
다음과 같은 클래스가 있고, racing 이라는 함수를 구현하려고 한다.

```
class Dog: Runable{ //...
}

class Horse: Runable{ //...
}

func racing(animals:[Runable]) -> Runable {
}

프로토콜타입으로 사용가능하다.
let winner:Runable = racing(animals: [Dog(),Horse()])

```


# - Delegate

- 델리게이트는 클래스나 구조체에서의 일부분의 할 일을 다른 인스턴스에게 대신 하게 하는 디자인 패턴
- 뷰가 받은 이벤트나 상태를 ViewController에게 전달해주기 위해 주로 사용된다.(ex:UIScrollViewDelegate...)
- ViewController를 통해 View구성에 필요한 데이터를 받는 용도로도 사용(ex:UITableViewDataSource)

직접 구현해보자!!

Delegate 선언부분

```
import UIKit

class MyCustomView: UIView {
    
    
    private var button: UIButton!
    
    var delegate:MyCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.brown
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        button = UIButton()
        button.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        button.setTitle("버튼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = self.bounds
        
        self.addSubview(button)
        
    }
    
    @objc func btnAction(_ sender: UIButton) {
        delegate?.didSelectedMyCustomView(self)
    }

}

protocol MyCustomViewDelegate {
    
    func didSelectedMyCustomView(_ customView: MyCustomView)
    
}

```

Delegate 구현부분

```
import UIKit

class ViewController: UIViewController, MyCustomViewDelegate, UIScrollViewDelegate{
    
    var display: UITextField!
    var strPrint: UILabel!
    var myCustomView:MyCustomView!
    var myCustomView2:MyCustomView!
    var sc: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        listCopy(list: 4)

        sc = UIScrollView()
        sc.frame = view.bounds
        sc.contentSize = CGSize(width: view.frame.size.width * 2, height: view.frame.size.height)
        sc.delegate = self
        view.addSubview(sc)
        
        myCustomView = MyCustomView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myCustomView.delegate = self
        sc.addSubview(myCustomView)
        
        myCustomView2 = MyCustomView(frame: CGRect(x: sc.frame.size.width + 100, y: 100, width: 100, height: 100))
        myCustomView2.delegate = self
        sc.addSubview(myCustomView2)
        
        
        display = UITextField(frame: CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height / 20))
        display.layer.borderWidth = 1
        self.view.addSubview(display)
        
        strPrint = UILabel(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.height / 20))
        strPrint.layer.borderWidth = 1
        self.view.addSubview(strPrint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x, scrollView.contentOffset.y)
    }
    
    func didSelectedMyCustomView(_ customView: MyCustomView) {
        print("아이탬을 선택하였습니다.")
        myCustomView.backgroundColor = UIColor.blue
        strPrint.text = display.text
    }
//
//    func listCopy(list: Int) {
//        for index in 0..<list {
//            let x:CGFloat = CGFloat(index * 10)
//            let list = MyCustomView()
//            list.frame =  CGRect(x: 100 + x, y: 100, width: 100, height: 100)
//            self.view.addSubview(list)
//
//        }
//    }

}
```


# 공부하면서 느낀점

protocol이란걸 사용하면서, 좀 더 객체 지향적으로 코딩을 할 수 있게 되었다. <br>
상속의 개념과 계층 구조를 통하여, 상속받은 상위 클래스에게 이벤트를 전달해 줄 수 없을때 Protocol을 이용하여 내가 원하는 방향의 코딩을 짤 수 있었다. 제일 상위 클래스인 View?Conntroller에 Protocol을 여러개를 채택하여, 효율적으로 사용하면 좋을 것 같다.