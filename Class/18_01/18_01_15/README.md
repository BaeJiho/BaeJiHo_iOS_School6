# - 변수와 함수

시스템 예약어는 사용불가 <br>
Ex) var,let 등등

숫자는 이름으로 시작될 수 없다. 하지만 이름에 포함할 수 있다.

공백이 포함될 수 없다. 그렇기에 카멜케이스로 이름을 짓는 이유다.

클래스 명은 어퍼카멜
변수&함수는 로워카멜

Int: 2의63승까지 표현이 가능함 앞에 부호가 포함. Int.max 를 프린트하면 어느정도까지 표현되는지 알아볼 수 있음.
Uint: 앞에 부호를 제외하고
(언사인)

# - Bool

!true = false

&& = and
둘중 하나라도 False면 False
\\ = or
둘중에 하나라도 true면 true

Double & Float

실수를 표현
Double은 Float의 2배를 표현한다.

# - 튜플

하나의 함수를 한꺼번에 여러가지 정보를 넣고 사용할 수 있도록 하는 기능이다.<br>
바로 실습해보도록 하자.

```
import UIKit

var str = "Hello, playground"

let sampleText = "<<<Hello>>>"

let startIndex = sampleText.index(sampleText.startIndex, offsetBy: 3)
let endIndex = sampleText.index(sampleText.endIndex, offsetBy: -4)
print()
let substring1: Substring = sampleText[startIndex...endIndex]
let resultStr:String = String(substring1) // “Hello”

var sampleTuple: (Int, String, Int) = (3, "joo", 4)

print(sampleTuple.0,sampleTuple.2)
print(sampleTuple.1)

func calculator(num1: Int, num2: Int) -> (Int, Int){
    return (num1 * num2, num1 + num2)
}
var re = calculator(num1: 10, num2: 10)

print(re)
func calculators(num1: Int, num2: Int) -> (Int, String){
    
    let sum:Int = num1 + num2
    
    return (sum, String(sum))
}

let ree: (intSum:Int, strSum: String) = calculators(num1: 10, num2: 20)
let intResult: Int = ree.intSum
let stringResult: String = ree.strSum

print(ree)

var stringNum: String
var doubleNum: Double
let intNum: Int = 3

var strintNum = String(intNum)

var ii: Int? = Int(strintNum)

var num1 = 10
var num2 = 8

func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

print(num1, num2)
swapTwoInts(&num1, &num2)
print(num1, num2)


func pass(num: Int) -> Int {
    return num
}

func getPI() -> Double {
    let pi: Double = 3.141592
    return pi
}

func sum(firstNum num1: Int, second num2: Int) -> Int {
    return num1 + num2
}

func sum(num1: Int, num2: Int = 5) -> Int {
    return num1 + num2
}

func passNum(_ num: Int) -> Int {
    return num
}

func swapTwoInts(lInt a: inout Int, rInt b: inout Int) {
    let temporaryA: Int = a
    a = b
    b = temporaryA
}




//정사각형
//func squareArea(length: Int) -> Int {
//    return length * length
//}
//
//func squarPerimeter(length: Int) -> Int {
//    return 4 * length
//}

//정사각형

func square(length: Int, width: Int) -> (squareArea: Int, squarePerimeter: Int){
    return((length * width),(4 * length))
}
var areaAndPerimeter = square(length: 10, width: 10)
print("정사각형의 값을 구한다.")
print("정사각형 면적의 값은 \(areaAndPerimeter.squareArea) and","정사각형 둘레 : \(areaAndPerimeter.squarePerimeter)")


//직사각형

func rectangle(width: Int, length: Int) -> (rectangleArea: Int, rectanglePerimeter: Int) {
    return (width * length, ((2 * width) + (2 * length)))
}
let  rectangleAreaAndPerimeter = rectangle(width: 10, length: 20)
print("rectangleArea : \(rectangleAreaAndPerimeter.rectangleArea)")
print("rectanglePerimeter : \(rectangleAreaAndPerimeter.rectanglePerimeter)")

//원
func circleRound(radius: Int, pi: Double) -> (Double, Double) {
    return (((Double(radius) * Double(radius)) * pi), (2 * pi * Double(radius)))
}

var circlevalue = circleRound(radius: 30, pi: 3.14)

print(circlevalue.0)

//삼각형

func triangle(diameter: Int, height: Int) -> Int {
    return (diameter * height)/2
}
var trianglevalue = triangle(diameter: 30, height: 20)
print("triangle value : \(trianglevalue)")

```



# - 지금까지 배운 공부를 가지고 실습해보자.
```
//: Playground - noun: a place where people can play

//<기초>
//1-a 이름(문자열)을 받아서 이름을 출력하는 함수
//1-b 나이(정수)를 받아서 나이를 출력하는 함수
//1-c.이름과 주소를 입력받아 자기소개글을 프린트 하는 함수(자기소개글은 자유)
//정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
//정수를 하나 입력받아서 제곱을 반환해주는 함수
//<응용 - 다중 입력, 반환>
//2-a. 두개의 정수를 입력받아 두수의 합을 반환해주는 함수
//2-b. 두개의 정수를 입력받아 두수의 차를 반환해주는 함수
//2-c. 두개의 정수를 입력받아 두수의 곱을 반환해주는 함수
//2-d. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수
//<응용>
//부모님과 내 나이를 입력 후 그 나이차를 프린드 하는 함수 (ex: "어머니의 나이는 40세이고 내 나이는 20살이므로 우리의 나이차이는 20살 입니다.)
//시험점수 여러개를 입력받아서(4개이상) 평균을 반환해주는 함수
//<캐스팅>
//정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
//정수를 두개를 입력받아 두수를 합친수를 출력하는 함수 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)
//실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수
import UIKit

var str = "Hello, playground"
//1. 기초
func printName(name: String) {
    print(name)
    
}

func printAge(age: Int) {
    print(age)
    
}

func printMySelf(name: String, address: String) {
    print("안녕하세요 제 이름은 \(name) 입니다. 제가 사는곳은 \(address)입니다. 잘부탁드립니다.")
    
}

func value(num: Int) -> Int{
    return num / 2
    
}
var sek = value(num: 10)
print(sek)

func value2(num1: Int) -> Int{
    return num1 * num1
    
}
var kkk = value2(num1: 10)
print(kkk)

//2. 응용
///두수를 더하시오
func value3(num1: Int, num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}

var twoPlus = value3(num1: 10, num2: 20)
print(twoPlus)

///두수를 빼시오
func value4(num1: Int, num2: Int) -> Int {
    let sum = num1 - num2
    return sum
}

var twoMinor = value4(num1: 10, num2: 20)
print(twoMinor)

///두수를 곱하시오
func value5(num1: Int, num2: Int) -> Int {
    let sum = num1 * num2
    return sum
}

var twoMultiply = value5(num1: 10, num2: 20)
print(twoMultiply)

///두수를 나누시오
func value6(num1: Int, num2: Int) -> Int {
    let sum = num1 / num2
    return sum
}
var twoDivision = value6(num1: 20, num2: 30)
print(twoDivision)

//응용

func motherAndMeAge(motherAge: Int, meAge: Int) {
    let minus = motherAge - meAge
    print("어머니의 나이는 \(motherAge)세이고 내 나이는 \(meAge)살이므로 우리의 나이차이는 \(minus)살 입니다.")
    
}

motherAndMeAge(motherAge: 60, meAge: 30)
print()

func studyExam(math: Int, korean: Int, history: Int, music: Int) -> Double {
    let average = (math + korean + history + music) / 4
    return Double(average)
}


var studyAverage = studyExam(math: 70, korean: 75, history: 70, music: 30)
print(studyAverage)

//캐스팅

func typecasting(num: Int) -> Double {
    return Double(num)
}
var varla = typecasting(num: 100)
print(varla)
//정수를 두개를 입력받아 두수를 합친수를 출력하는 함수 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)

func strTrans(num1: Int, num2: Int) -> String {
    return String(num1) + String(num2)
}

var strValue = strTrans(num1: 3, num2: 4)
print(strValue)

//실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수
func rounds(num1: Double) -> Int {
    return Int(round(num1))
}

print(round(1.6))

```

# - 공부하며 느낀점
서로 다른 타입을 대입해서 리턴해줄때 반드시 return해주는 타입과 동일하게 해줘야한다. 만약 다르다면 앞에 바꿀 타입에 (변수)를 입력하면 타입캐스팅이 가능하다. 알고리즘 문제를 많이 풀어봐야 할 것 같다. 아직은 머리속에 구조가 떠오르지않아 힘든점이 있다. 
