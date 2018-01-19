# - Collection Type 

###데이터 정리할때 유용

배열 - Array<br>
집합 - Dictional<br>
사전 - Set<br>

Collection Type은 var 로 선언이 되어있어야 변경이 가능하다.

# - Array

배열(영어: array)은 번호(인덱스)와 번호에 대응하는 데이터들 로 이루어진 자료 구조를 나타낸다. 일반적으로 배열에는 같은 종류의 데이터들이 순차적으로 저장되어, 값의 번호가 곧 배열의 시작점으로부터 값이 저장되어 있는 상대적인 위치가 된다. 

# - Array 문법

기본 표현은 Array<Element>로 Array Type을 나타낸다. 여기에서 Element는 배열에 저장할수 있는 타입이다. 또 다른 축약 문법으로 [Element] 로 표현할 수 있다. 

- 배열의 Element 갯수 <br>
.count<br>
- 빈 배열 확인 <br>
.isEmpty <br>
- Element 추가 <br>
.append -> 1개씩 추가할 경우<br>
.append(contentsOf:)<br>
- Element 삽입 <br>
.insert(“Liam”, at: 3)<br>
- Element 삭제 <br>
.remove(at:) -> Index 숫자를 지정<br>
.removeSubrange(_:) -> Index 를 지정해줘서 바꿔주는것(교체)<br>
.removeLast() -> <br>

# - Set

Set은 같은 타입의 데이터가 순서없이 모여있는 자료구조, 각 항목의 순서가 중요치 않거나 한번만 표시해야하는 경우 배열대 신 사용된다. 
중복이 없다.
타입을 지정해 주어야만 Set으로 사용이 가능하며, 타입을 정해주지 않으면, Array로 작동

Set은 정열이 되어있지 않지만, 정열하면 Array다.

# - Dictionary

key를 가지고 순서를 구분 해낼 수 있다.
key값을 통해 Value값을 가져올수 있다. 
보통 [String:Any]이기 때문에 key값을 통해 Value값을 불러올때 진정한 캐스팅을 해줘야한다.

# - Dawn casting

Any가 제일 상위 타입이기 때문에 하위 타입을 지정할때는 Down casting을 해줘야한다.
 as! String 