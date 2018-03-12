# - 복습

![uisample](https://user-images.githubusercontent.com/35207193/35778661-b39ec69e-0a04-11e8-908d-790738c2799a.gif)


반복 실습할 프로젝트 파일을 만든 뒤 ViewController에서 사용할 UI를 만들어 모아놓고 사용할 새로운 파일을 생성하였다.
여기서 새롭게 뉴 파일을 생성하고난 뒤에는 cocoa touch Class로 생성하여 UIView를 상속받는 클래스를 생성하고 틀을 제작하였다.<br>
모든 객체는 UIView 위에 addSubView를 하였고 UIImageView, UILable 마지막으로 UIButton을 추가하였다.

```
import UIKit

class CustomView: UIView {

    var bgImgView: UIImageView?
    var titleLb: UILabel?
    var subTitleLb: UILabel?
    var btn: UIButton?
    
    var title: String? {
        get {
            return titleLb?.text!
        }
        set {
            titleLb?.text = newValue
        }
    }
    
    var subTitle: String? {
        get {
            return subTitleLb?.text!
        }
        set {
            subTitleLb?.text = newValue
        }
    }
    
    var imageSet: UIImage? {
        get {
            return bgImgView?.image
        }
        set {
            bgImgView?.image = newValue
        }
    }
    
    var index: Int = 0 {
        didSet {
            btn?.tag = index
        }
    }
    
    
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        toolSet()
        layoutFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func toolSet() {
        bgImgView = UIImageView()
        self.addSubview(bgImgView!)
        
        titleLb = UILabel()
        titleLb?.font = UIFont.systemFont(ofSize: 20)
        titleLb?.textAlignment = NSTextAlignment.center
        self.addSubview(titleLb!)
        
        subTitleLb = UILabel()
        subTitleLb?.font = UIFont.systemFont(ofSize: 16)
        subTitleLb?.textAlignment = NSTextAlignment.center
        self.addSubview(subTitleLb!)
        
        btn = UIButton(type: .custom)
        self.addSubview(btn!)
    }
    
    func layoutFrame() {
        let xWidth:CGFloat = self.frame.size.width
        let yHeight:CGFloat = self.frame.size.height / 3 * 2
        
        bgImgView?.frame = CGRect(x: 0, y: 0, width: xWidth, height: self.frame.size.height)
        titleLb?.frame = CGRect(x: 0, y: 0, width: xWidth, height: yHeight)
        subTitleLb?.frame = CGRect(x: 0, y: yHeight, width: xWidth, height: self.frame.size.height - yHeight)
        btn?.frame = CGRect(x: 0, y: 0, width: xWidth, height: self.frame.size.height)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        btn?.addTarget(target, action: action, for: controlEvents)
    }
}


```

이렇게 만든 객체를 내가 원하는 조건으로 ViewController에서 조건문을 통하여 완성하였다.

```
import UIKit

class ViewController: UIViewController {

    var displayView: UILabel!
    var padView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView()
        createView(4)
        
    }
    
    func mainView() {
        displayView = UILabel(frame: CGRect(x: 0, y: view.frame.size.height / 2, width: view.frame.size.width, height: view.frame.size.height / 2))
        view.addSubview(displayView)
        
        padView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2))
        view.addSubview(padView)
        
    }
    
    func createView(_ box: Int) {
        for index in 0..<box {
            var margin: CGFloat = 10
            var x: CGFloat = CGFloat(index % 2)
            var y: CGFloat = CGFloat(index / 2)
            
            
            let test = CustomView(frame: CGRect(x: (margin + (x * 150)) + margin, y: (margin + (y * 200)) + margin, width: 150, height: 200))
            test.imageSet = UIImage(named: "sea.jpeg")
            test.title = "제목"
            test.subTitle = "소제목"
            test.btn?.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            test.index = index
            
            
            padView.addSubview(test)
        }
    }
    
    @objc func btnAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            return displayView.text = "첫번째 버튼을 선택하셨습니다."
        case 1:
            return displayView.text = "두번째 버튼을 선택하셨습니다."
        case 2:
            return displayView.text = "세번째 버튼을 선택하셨습니다."
        case 3:
            return displayView.text = "네번째 버튼을 선택하셨습니다."
        default:
            return displayView.text = "존재하지 않습니다."
        }
    }
    


}

```

기본적으로 화면상에 display와 pad부분을 나누었으며 미리 만든 객체를 pad를 기준으로 addSubview를 하였다.

# 공부하며 느낀점

get set에 대해서 다시 한번 공부하게 되었다. 이렇게 편리할줄은 꿈에도 생각하지 못하였다. 강사님께서 실습을 통하여 보여주셨을때도 크게 와닿지 못하였던 방법을 다시 한번 곱씹어보며 공부할때 가장 큰 충격인듯하다. 코딩을 하면서 반복적인 코드를 작성하는것보다 좀 더 유용하고 짧고 간결한 코딩 방법을 생각해 보도록 하자.