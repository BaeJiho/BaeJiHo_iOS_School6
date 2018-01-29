# - UI Base Guide


Pixel : 실제 이미지 사이즈<br>
 Point : 화면에 표시되는 이미지 사이즈 

실질적인 단위는 Pixel이지만 아이폰에서 사용하는 단위는 Point이다.

 
### Frame - Base

하나의 뷰 하나하나를 프레임이라는 단위로 만들어서 화면에 배치

좌측 최 상단이 기준점.
우측으로 갈수록 숫자 증가
가로 = x 축, 
세로 = y 축

Ex) (10,10,100,100)
x = 10,
y = 10,
width = 100,
height = 100

화면 사이즈들이 변경되면서 문제가 되기 시작함


### Auto-Layout

Story-board 에서 사용
어떠한 제약을 만들어서 화면을 만족하게끔 구현

Framework 

클래스와 라이브러리 모임

사용하는 방법
Import UIKit

우리가 사용하는건 객체지향형 Framework이기 때문에 NSObject의 룰을 따라야한다.

UIResponder

UIView
기본적으로 사각형 말고는 구현할 수 없다. 
모든 UI는 UIView를 상속받았다.

<img width="500" alt="ui" src="https://user-images.githubusercontent.com/35207193/35514484-afa01d1e-0549-11e8-83fb-239a5795f082.png">


##UIView를 실습해보기

```
import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    
        let list:[UIView] = makeViewList(num: 10)
        getFrame(list: list)
        subAddView(list: list)
        print(list)
        
        
    }
    
    func makeViewList(num: Int) -> [UIView] {
        var vList: [UIView] = []
        for num in 0..<num {
            let v = UIView()
            v.backgroundColor = getColor(inputNum: num)
            v.tag = num
            vList.append(v)
        }
        return vList
    }
    
    func getColor(inputNum: Int) -> UIColor {
        switch inputNum % 3 {
        case 0:
            return UIColor.blue
        case 1:
            return UIColor.red
        case 2:
            return UIColor.green
        default:
            return UIColor.blue
        }
    }
    
    func subAddView(list:[UIView]) {
        for index in 0..<list.count {
            if index == 0 {
                view.addSubview(list[index])
            }else {
                list[index-1].addSubview(list[index])
            }
        }
    }
    
    let margin: CGFloat = 15.0
    func getFrame(list:[UIView]) {
        for index in 0..<list.count {
            if index == 0 {
                list[index].frame = CGRect(x: margin, y: margin, width: view.bounds.size.width - margin*2, height: view.bounds.size.height - margin*2)
            }else {
                let superFrame = list[index-1].frame
                list[index].frame = CGRect(x: margin, y: margin, width: superFrame.size.width-margin*2, height: superFrame.size.height-margin*2)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

```

UIView 배열을 만들어 갯수를 정한뒤 배열을 이용하여 배열의 갯수만큼 CGRect를 생성하는 함수를 생성<br>
RootView인 main View에 addSubview를 한 뒤 처음 addSubview한 배열을 기준으로 UIView 배열의 count만큼 추가하였다.

<img width="455" alt="default" src="https://user-images.githubusercontent.com/35207193/35514858-e385cb3c-054a-11e8-87fb-6aa288279b69.png">



# 공부하며 느낀점

추가적인 공부로 인하여, 계산기의 UI를 만들어보고 있는 중에 addSubview에 대하여 부족한것을 많이 느꼈다.
무엇이 기준이며, 그 기준위에 어떤 UIView를 추가하여 원하는 UI를 만들것인지를 좀 더 연구해야 할 것 같다.

