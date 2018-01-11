# - 객체 지향 프로그래밍

Object Oriented Programming

## 기본 문법

변수와 함수<br>
property, method

일반적으로 하나의 파일에 하나의 클래스가 존재함.
하지만 파일 하나에 여러개의 클래스가 존재할때도 있음.
클래스 만드는것은
class Parson { 변수 & 함수 }<br>

클래스 안에서는 변수와 함수를 선언만 가능<br>

클래스 안에 변수 함수를 넣는 이유는 묶어서 관리하기 위해서 이며,<br>
변수는 저장공간, 메모리에 담김<br>
함수는 실행하는 행위 CPU에서 처리<br>

변수를 만들어서 사용할때에는 이름과 타입이 반드시 필요하다.
키워드 + 변수 명(Name) + 변수 타입(Type)
문법 : var vName: Any

이름 : 잘 짓기(Lower Camel Case)<br>
타입을 적기 전에는 : 을 붙임 (Upper Camel Case)<br>

변수에 값을 넣는건 = 을 사용<br>
변수명(Name) = 값(Value)<br>
우항에서 좌항으로 대입<br>
그렇다면  좌항은 그릇 우항은 밥<br>

함수는 어떠한 값이 들어오는것 (input Value) x는 파라미터(매개변수)<br>

함수의 이름은 어떠한 행동을 하는지를 유추해서 적어줘야한다. <br>

키워드 + 함수명(Name) + 입력값(Input Value) + 함수 내용(Action) + 결과타입(Return Type) 

클래스 내부에 모든 프로포티는 초기화가 되어 있어야한다. <br>

클래스 내에서 함수는 순서가 상관이 없다.

유의사항

클래스 내에서 
변수는 선언만 가능
함수는 실행만 가능

---

# - 객체지향으로 짜본 과일 가게
과일 가게라는 클래스를 만들어서 그 안에 여러가지의 변수와 함수를 정의

```
class FruitStore {
    //직원
    var name: String = ""
    var age: Int = 0
    var city: String = ""
    //과일의 정의
    var fruitName: String = ""
    var taste: String = ""
    var origin: String = ""
    func work(){
        print("이번에 채용된 \(name)은 나이가 \(age)살이며, 살고있는 도시는 \(city)이다.")
    }
    func sell(money giveMeMoney: Int){
        print("\(name)는 \(fruitName)을 \(giveMeMoney)원 받고 손님한테 팔았다. \(fruitName)의 맛은\(taste)며, 원산지는 \(origin)이다.")
    }
    
}
```

main에서 FruitStore라는 클래스를 store라는 이름의 객체를 연결 후 

```
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let store: FruitStore = FruitStore()
        store.name = "지호"
        store.age = 20
        store.city = "신사동"
        
        store.fruitName = "귤"
        store.origin = "베트남"
        store.taste = "달"
        
        store.work()
        store.sell(money: 10000)
    }
```

# - 공부하며 느낀점

Swift 기본 문법을 시작하였다.
클래스가 사용자 정의 데이터형으로 type이 될 수 있다는 점이 흥미로웠다.<br>
변수 타입이 다르면 에러가 나는 점을 통해 타입캐스팅을 해야하고 return을 하면서도 타입캐스팅을 좀 더 신경써야할 것 같다.