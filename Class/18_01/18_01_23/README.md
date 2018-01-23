# - Initialization(초기화)

# Class - 상속

클래스에서만 상속이 가능하다.
기존에 클래스에서 확장하는 방법 중 하나.

부모 클래스(super class, parent class)<br>
자식 클래스(sub class, child class)<br>

상속 할 수록 더 확장되는 구조<br>

단 하나의 클래스만 상속 받을수 있다.<br>
Struct, enum은 상속받을수 없다.<br>
클래스만 가능하다.<br>

클래스 이름 뒤에 (: 부모클래스)를 추가 한다.<br>

프로토콜과 문법이 같다.<br>

(: 상속클래스, 프로토콜, 프로토콜)<br>

##### Designated initializers<br>

모든 프로포티를 초기화 시켜야한다.

##### Convenience initializers<br>


##### Required init<br>

해당 initializer는 필수적으로 구현해야만 한다.<br> 상속받은 모든 클래스는 필수로 구현해야 한다.<br> required initializer를 구현할땐 override 수식어를 사용할 필요 없다.<br> 

## Classes VS Structres<br>

Class는 참조 타입이며, Structure는 값 타입이다. <br>

Struct - Value Type 프로퍼티 수정

기본적으로 구조체와 열거형의 값타입 프로퍼티는 인스턴스 메소드 내에 서 수정이 불가능 하다.<br>
그러나 특정 메소드에서 수정을 해야 할경우에는 mutating 키워드를 통해 변경 가능하다.<br>

# - 다형성

재정의(Override)와 중복정의(Overload)는<br>
OOP의 다형성의 또다른 모습


#### Struct를 써야하는 상황

연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때 <br>
캡슐화된 값이 참조되는 것보다 복사되는 것이 합당할 때 <br>
구조체에 저장된 프로퍼티가 값타입이며 참조되는 것보다는 복 사되는 것이 합당할때<br>
다른 타입으로부터 상속받거나 자신이 상속될 필요가 없을 때 <br>


