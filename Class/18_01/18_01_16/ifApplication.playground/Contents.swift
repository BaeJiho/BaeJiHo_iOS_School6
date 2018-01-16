//: Playground - noun: a place where people can play

import UIKit

//<if>
//정수를 하나 입력받아 그 수가 짝수이면 true를  반환하는 함수
//문자열 두개를 입력받아 두 문자열이 같으면 true를 반환해주는 함수
//두 수를 입력받아 큰 수를 반환하는 함수를 작성하세요.
//정수를 하나 입력받아 3의 배수이면 true를 반환해주는 함수
// 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수 (첫번째 값을 두번째 값으로 나눈다. 0으로 나누기를 할시 0을 반환)
//응용
//시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
//여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
//윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
//세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.



func evenValue(num: Int){
    
    if(num % 2 == 0){
        print("true")
    }else{
        print("false")
    }
}
evenValue(num: 9)

func strCompare(num1: String, num2: String) {

    if(num1 == num2){
        print("true")
    }else{
        print("false")
    }
}

strCompare(num1: "123", num2: "123")


func valueCompare(num1: Int, num2: Int) {
    if (num1 > num2){
        print(num1)
    }else if(num1 < num2){
        print(num2)
    }else {
        print("두 수의 값이 같습니다.")
    }
}
valueCompare(num1: 30, num2: 30)

func threeEvenValue(num: Int){
    
    if(num % 3 == 0){
        print("true")
    }else{
        print("false")
    }
}

threeEvenValue(num: 99)

// 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수 (첫번째 값을 두번째 값으로 나눈다. 0으로 나누기를 할시 0을 반환)

func twoValue(num1: Int, num2: Int) -> Double{
    if (num2 == 0) {
        return 0
    }else {
        return (Double(num1) / Double(num2))
    }
}
print(twoValue(num1: 30, num2: 2))

//시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
//func grade(score: Int) -> String{
//
//    if score <= 100 {
//        if(95 <= score && score <= 100) {
//            print("A+")
//        }else if(90 <= score && score <= 95) {
//            print("A")
//        }else if(85 <= score && score <= 90) {
//            print("B+")
//        }else if(80 <= score && score <= 85) {
//            print("B")
//        }else {
//            print("f")
//        }
//    }else {
//        print("헛소리하지마 임마!")
//    }
//    return String(score)
//}
//grade(score: 100)

//여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
//func point(of grade:String) -> Double{
//
//    var point: Double = 0.0
//    if grade == "A+"
//    {
//        point = 4.5
//    }else if grade == "A"
//    {
//        point = 4.0
//    }else if grade == "B+"
//    {
//        point = 3.5
//    }else if grade == "B"
//    {
//        point = 3.0
//    }else if grade == "C+"
//    {
//        point = 2.5
//    }
//    return point
//}

//윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
//1. 그 해의 숫자가 4의 배수인 경우는 윤년이다.   예) 2004는 4로 나누어지므로 윤년!
//2. 그 해의 숫자가 4로 나누어지지만 100으로도 나누어 지면 윤년이 아니다.   예) 2100년은 4로 나누어지지만 100으로 나누어지므로 윤년이 아니다!
//3. 그 해의 숫자가 100으로 나누어지지만 400으로도 나누어 지면 윤년이다.    예) 2000년은 100으로 나누어지지만 400으로도 나누어지므로 윤년이다

func yearsDay(year: Int) -> String{
    if ((year % 4 == 0)) {
        return String("윤년")
    }else{
        return String("윤년이 아닙니다.")
    }
}
print(yearsDay(year: 2016))


//세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.

//func threeValueEvan(num1: Int, num2: Int, num3: Int){
//
//}

//func grade(of score:Int) -> String
//{
//    var grade: String = "F"
//    if score <= 100
//    {
//        if score <= 100 && score >= 95
//        {
//            grade = "A+"
//        }else if score >= 90
//        {
//            grade = "A"
//        }else if score >= 85
//        {
//            grade = "B+"
//        }else if score >= 80
//        {
//            grade = "B"
//        }else if score >= 75
//        {
//            grade = "C+"
//        }
//    }
//    return grade
//}

func grade(of score: Int) -> String {
    let grade: String = "f"
    if score <= 100{
        switch score {
            case 95...100:
                print("A+")
            case 85..<95:
                print("A")
            case 75..<85:
                print("B+")
            case 65..<75:
                print("B")
            default:
                print(grade)
        }
    }
    return grade
}
print(grade(score: 50))

