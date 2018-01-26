# - 접근제어


open 은 외부 모듈의 상속 가능<br>

public은 외부 모듈의 상속 불가

internal은 내부에서 사용 가능 기본적으로 생성되는 타입

fileprivate (파일외 비공개) : 파일 내부에서만 접근가능<br>

private (비공개) : 클래스 기능 내부에서만 가능 + 같은 클래스 안에서의 extent도 사용 가능하다.


# - Property

클래스 내부에서 사용하는 변수<br>
초기화 변수와 구별을 확실히 해야한다.<br>
클래스, 구조체, 열거형에서 전체의 속성으로 사용되는 변수를 프로퍼티라고 한다.


### 프로퍼티의 종류

- 저장 프로퍼티(Stored Properties)

지금까지 사용한 가장 일반적인 프로퍼티 값을 저장하는 용도로 사용한다.

- 지연 저장 프로퍼티(Lazy Stored Properties)

초기화하는데 전부다 하는것이아니라 그때그때 초기화를 해서 속도를 원활하게 하는 장점이있다.

```
class ViewController: UIViewController {//init 시점이 아닌 사용이 되는 시점에 초기화 한다.	lazy var cal:Calculator = Calculator()	override func viewDidLoad() {		super.viewDidLoad()
 	}
	cal.average(student: Student())
}

```

- 연산 프로퍼티(Computed Properties)

변수처럼 실질적인 값을 저장할수 없다.
함수와 거의 같다.
프로퍼티의 값을 넣거나 뺄때 하는 연산프로퍼티를 사용할 수 있다.
get set키워드를 통해서 설정 가능하다.
Get = 값을 빼낼때 return이 항상 필요하다. 
Set = 값을 넣는것 input이 필요, 만약 넣지 않았다면 newValue라는 이름으로 자동생성(저 이름으로 접근가능)

Get 하나만 사용이 가능하며 get,set 둘다 사용할 경우 네임을 적어줘야하며, set은 혼자 사용할 수 없다.

앞서 정리했던 학생 성적 프로그램 코드 부분에서 get, set로 변경해보았다.

```
var subjectsDic: [String:Int] = [:]
    
    var subjects: [Subject] {
        get {
            var resultList:[Subject] = []
            for (subName,subScore) in subjectsDic {
               let newValue = Subject(name: subName, score: subScore, isHasGrade: grade)
               resultList.append(newValue)
            }
            return resultList
        }
        set {
            for subject in newValue {
                subjectsDic.updateValue(subject.score, forKey: subject.name)
            }
        }
    }

```

- 프로퍼티 옵저버(Property Observers)

관찰자 역활, 어떠한 상황이 만들어 졌을때 실행<br>
저장프로퍼티여야하며, 초기값이 초기화가 되어야한다.(옵셔널가능)<br>
연산프로퍼티와 비슷하다.<br>

```
var changeValue:Int = 0 {
    willSet {
        print("현재값은 \(changeValue)이고 곧 \(newValue)로 바뀔것이다.")
    }
    didSet {
        print("현재값은 \(changeValue)이고 바뀌기 전 값은 \(oldValue)이다.")
    }
    
    
}
changeValue = 4


```

# 공부하며 느낀점

get,set은 연산프로퍼티이기때문에 저장하는 프로퍼티는 존재하지않는다.
내가 일반적으로 사용하고 있는 프로퍼티는 저장 프로퍼티이며, 연산 프로퍼티를 이용해서 좀 더 코드를 간결하게 활용할 수 있는 용이점이 있다. willSet과 didSet은 저장 프로퍼티의 한 속성이며, 초기화 된 변수를 가지고 앞으로의 있을 변화를 체크하여 좀 더 관리가 편리한 코드를 짤수있다.

