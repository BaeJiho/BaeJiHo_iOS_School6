# - 옵셔널

nil의 중요성

Type Safety

- nil인 상태에서 속성을 참조하거나, 함수를 실행시 발생하는 error로 인한 코드의 불안정성 내포 
- Swift의 중요한 특징 중 하나는 Safety!! 
- Type Safety를 위해 컴파일러 수준의 nil 체크 
- 만약 nil인 변수 선언을 해야할 경우 optional을 사용한다. 
- optional은 두가지 가능성을 가질수 있는데 한개는 값이 있음을 나타내고 <br> 또다른 한가지는 nil일 가능성을 내포하고 있다.(?기호 사용) 

<img width="500" alt="1" src="https://user-images.githubusercontent.com/35207193/35390869-30cb99b8-0220-11e8-8692-b092331effd8.png">

<img width="500" alt="2" src="https://user-images.githubusercontent.com/35207193/35390888-42c3e9ae-0220-11e8-9ffe-017ba6067aad.png">


##  Unwrapping

Optional 변수에 값이 있음을 확인하여 일반 변수로 전환해준다.<br>

- Forced Unwrapping
- Optional Binding
- Early Exit


### - Forced Unwrapping

```
func testFuc(optionalStr:String?) {
    if optionalStr != nil {
       let unwrapStr:String = optionalStr!
       print(unwrapStr)
    }
}
```

optionalStr 값이 nil이 아닐시 unwrapStr 상수에 optionalStr을 강제로(!) 넣어준다.

### - Optinal Binding

```
func testFuc(optionalStr:String?) {
    if let unwrapStr:String = optionalStr {
       print(unwrapStr)
    }
}
```
옵셔널 바인딩은 옵셔널의 값이 존재하는지를 검사한 뒤, 존재한다면 그 값을 다른 변수에 대입시켜줍니다.<br> if let 또는 if var를 사용하는데요. 옵셔널의 값을 벗겨서 값이 있다면 if문 안으로 들어가고, 값이 nil이라면 그냥 통과하게 됩니다.


### - Early Exit

```
guard 조건값 else {
//조건값이 거짓일때 실행
//종료 조건이 항상 필요 
}

```

guard를 사용해서 해당 조건값이 false면 실행하라 라는 guard 조건값 else {} 를 사용할 수 있다.


# 공부하며 느낀점

옵셔널을 통하여 nil값이 들어왔을때의 대처방법과 좀 더 객체 지향적인 프로그램을 짤 수 있었다.<br>
하지만, 아직 어느때에 옵셔널을 이용하여 좀 더 편리하게 사용해야할지 감이 잡히지않는 상황이다.<br>
추가적으로 조건문에 대해서 다시 복습을 해야 할 것 같다. 생각한 알고리즘을 코드로 입력할 때 조건문이 어색함과 동시에 Bool의 사용이 너무나도 어색한 상황이다. 좀 더 노력해보자.
