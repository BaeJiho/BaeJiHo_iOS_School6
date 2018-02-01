# - UILabel

화면에 택스트를 보여주는 영역으로써 많이 사용된다.

ViewController안에서 UILabel을 생성해보자.

```
let titleLb: UILabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150))
        titleLb.text = "UI Test View"
        titleLb.textColor = UIColor.darkGray
        titleLb.font = UIFont.systemFont(ofSize: 45)
        titleLb.textAlignment = .center
        view.addSubview(titleLb)

```

UILabel도 UIView와 마찬가지로 frame을 지정할수 있고, text를 만질수있다.
<img width="350" alt="uilabel" src="https://user-images.githubusercontent.com/35207193/35678903-7bcbe0a8-0798-11e8-91d9-f8b37b582a30.png">

이렇게 UILabel이 생겼다. 여기서 개인적으로 중요하게 생각하는것은 마지막 부분인 view.addSubview(titleLb) 이부분이다.<br>
이미지에보면 mainView인 ViewController 위에 UILabel이 올려져있다. 앞으로 어플을 기획하고 공부할때 어느 위치에
addSubview를 할것인지 잘 고민해보고 설계하도록 하자.

추가로 UILabel을 한개 더 생성해보자.

```
centerTextLb = UILabel(frame: CGRect(x: 0, y: view.frame.size.height / 2 - 75, width: view.frame.size.width, height: 150))
        centerTextLb.text =
        """
        중간에 표시되는 텍스트
        오~
        쏠~~~~~~~~레~미~...오~~
        """
        centerTextLb.font = UIFont.systemFont(ofSize: 20)
        centerTextLb.textColor = UIColor.brown
        centerTextLb.numberOfLines = 0
        centerTextLb.lineBreakMode = .byWordWrapping
        centerTextLb.textAlignment = .left
        view.addSubview(centerTextLb)

```

이번엔 """ """ 라는 코드를 사용하였다. 이 코드는 3개의 쌍따옴표 안에 있는 텍스트들이 그대로 출력된다. 한 텍스트를 여러줄 사용할때 쓰면 유용할 것 같다. <br>

# - UIButton

전에 정리했던 UIButton을 다시 한번 실습해보았다.<br>

우선 버튼을 3개를 만들어 보았다.

```
let btnOne: UIButton = UIButton(type: .custom)
        btnOne.frame = CGRect(x: 20, y: 20, width: 45, height: 45)
        btnOne.setTitle("하나", for: .normal)
        btnOne.setTitleColor(.blue, for: .normal)
        btnOne.setTitleColor(.red, for: .selected)
        btnOne.backgroundColor = UIColor.white
        btnOne.tag = 1
        btnOne.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
        view.addSubview(btnOne)

        let btnTwo: UIButton = UIButton(type: .custom)
        btnTwo.frame = CGRect(x: 80, y: 20, width: 45, height: 45)
        btnTwo.setTitle("두울", for: .normal)
        btnTwo.setTitleColor(.blue, for: .normal)
        btnTwo.setTitleColor(.red, for: .selected)
        btnTwo.backgroundColor = UIColor.white
        btnTwo.tag = 2
        btnTwo.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
        view.addSubview(btnTwo)

        let btnThree: UIButton = UIButton(type: .custom)
        btnThree.frame = CGRect(x: 120, y: 20, width: 45, height: 45)
        btnThree.setTitle("세엣", for: .normal)
        btnThree.setTitleColor(.blue, for: .normal)
        btnThree.setTitleColor(.red, for: .selected)
        btnThree.backgroundColor = UIColor.white
        btnThree.tag = 3
        btnThree.addTarget(self, action: #selector(logoAction(_:)), for: .touchUpInside)
        view.addSubview(btnThree)
```


<img width="204" alt="button" src="https://user-images.githubusercontent.com/35207193/35679688-5adec84e-079b-11e8-9bea-7561f8ad76fa.png">




이렇게 기본적인 버튼위에 title까지 넣어보았는데 여기서 봐야할 부분은  setTitle부분이다.
button에는 addTarget으로 버튼에 action Event를 지정해줄수 있다.
기본적인 디폴트값은 .normal 상태이며, blue색을 지정해놓았다. 이미지 상에서 보이듯이 말이다.
여기서 텍스트를 클릭하면 selected가 true 상태로 변환이 되면서 red로 바뀐다. 이처럼 내가 원하는 방식으로 버튼을 <br>
커스터마이징 할 수 있다.

# - UIImageView

UIImage가 있고 UIImageView 가 있다. 이건 확실히 알아야하는 부분이기도 하다.<br>
UIImage는 이미지 자체를 생성할수 있으며, UIImageView는 UIView를 상속받고있는 UIView 중 하나이다.

```
let bgImage: UIImage = UIImage(named: "bg")!

        let bgImageView: UIImageView = UIImageView(frame: view.bounds)
        bgImageView.image = bgImage
        bgImageView.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(bgImageView)

```

이렇게 이미지타입으로 변수를 선언하고 그 안에 이미지를 넣는다. (named: ) 안에 들어갈 주소값은 이미지 주소값을 넣으면 된다. 이때 UIImage는 옵셔널 타입으로 !를 사용하여 강제추출을 해주도록하자.

이렇게 만든 이미지를 이미지뷰에 넣어서 UILabel처럼  addSubview를 통해 사용이 가능하다.

# 공부하며 느낀점

UIButton에 이미지를 넣을수 있다는 점은 이전에도 이미지를 통해 내용을 정리한적이 있다.
하지만 이미지를 올리고 텍스트를 넣으면 이미지의 사이즈도 같이 증가하여 텍스트가 밖으로 밀려 보이지 않는 이슈가 생기게 되었다. 이 점은 각각 view로 만들어서 하나의 view 위에 addSub하면 해결 할 수 있지만, 좀 더 공부를 통하여 해결할 수 있도록 해보자.<br>
