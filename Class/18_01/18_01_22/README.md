# - Class & Structures 

- 프로그램 코드 블록의 기본 구조이다.
- 프로퍼티와 메서드를 추가 할수 있다. (두 구조의 문법 같음)
- 단일 파일에 정의 되며(필수는 아니다) 다른 코드에서 자동으로 사용 할수 있습 니다.<br>(접근 제한자에 따라 접근성은 차이가 있다. internal 기본 접근 제한자)
- 인스턴스 생성 및 초기 상태를 설정하기 위해 initializer(초기화 메소드)를 사용 하고,<br> 사용자의 니즈에 맞춰 Custom한 initializer를 만들어 사용할 수 있다.
-  둘 구조 모두 메모리에 적재되면 instance라고 불린다.
-  기본 블록에 추가하여 확장된 블록을 추가 할 수 있다. (Extensions)
-  프로토콜을 채택하여 사용할 수 있다.

#### 기본 문법


```
class SomeClass {// class definition goes here}
 struct SomeStructure {// structure definition goes here}

```

#### 기본 구조


```
class VideoMode {var resolution = Resolution()var interlaced = falsevar frameRate = 0.0var name: String?}struct Resolution {}
var width = 0var height = 0

```

#### 인스턴스 생성

```
let someVideoMode: VideoMode = VideoMode()
 let someResolution: Resolution = Resolution()

```

#### Propertise 접근 방법

```
let someVideoMode: VideoMode = VideoMode()print("VideoMode is \(someVideoMode.resolution.width)”)
let someResolution: Resolution = Resolution()print("Resolution is \(someResolution.width)”)

```


Class 는 struct의 인스턴스를 가지고 올 수 있다. <br>
하지만 struct는 class의 인스턴스를 가지고 올 수 없다.

# - Initialization 초기화

초기화는 클래스, 구조체, 열거형의 인스턴스를 만들기 위한 준비 과정으로 사용된다.

- 인스턴스에 설정된 속성의 초기값을 설정과 초기화하는데 목적이 있다.
- 클래스 및 구조체는 인스턴스로 만들어 질때 모든 프로퍼티는 적절한 초기값으로 모두 초기화를 해야한다.
- 구조체는 자동으로 Memberwise Initializers가 만들어 진다.

#### 기본적인 초기화 

```
struct Subject {
       var name:String
}

class Student {
    var subjects:[Subject] = []

	func addSubject(name:String) {

		let subject = Subject(name: name)
   		subjects.append(subject)
   	}
}

var wingMan:Person = Person() <- Initializers 
var wingMan:Person = Person.init()

```


init() 초기화 메소드

init() 파라미터 안에는 기본적으로 아무것도 넣지 않는다.

# 공부하며 느낀점

객체지향적으로 하나하나의 역활을 만들어 그것들을 조합하는 훈련을 해야할 것 같다.
무엇을 만들것이며, 이것을 만들고 구동하려면 어떠한 것들이 있는지를 먼저 구상해보고 파악해보자.

