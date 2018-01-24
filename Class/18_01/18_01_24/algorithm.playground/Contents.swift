//: Playground - noun: a place where people can play

import UIKit

// number = 123이면 1 + 2 + 3 = 6을 return하면 됩니다.
func sumNumb(of number: Int) -> Int {
    
    let strNum: String = String(number)
    var totalNum = 0
    
    for n in  strNum{
        let num: String = String(n)
        totalNum += Int(num)!
    }
    return totalNum
}
sumNumb(of: 654)

// 4와 3을 입력 받으면 4부터 시작해서 4씩 증가하는 숫자를 3개 가지는 리스트를 만들어서 리턴합니다.
func numberGenerator(x: Int, n: Int) -> [Int] {
    var total : [Int] = []
    
    for i in 1...n {
        total += [x * i]
    }
    return total
}
numberGenerator(x: 4, n: 3)

// 어떠한 크기의 배열이 와도 평균이 구해지는 함수를 만들자.

func arrayList(num: [Int]) -> Double {
    var total = 0
    
    for n in num {
        total += n
    }
    
    let totalNum = Double(total) / Double(num.count)
    return totalNum
}
arrayList(num: [91,80,47,38,70])

//대문자와 소문자가 섞여있는 문자열 s를 매개변수로 입력받습니다.
//s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 리턴하도록 함수를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다.
//예를들어 s가 pPoooyY면 True를 리턴하고 Pyy라면 False를 리턴합니다.


func strText(t: String) -> Bool {
    var num1: Int = 0
    var num2: Int = 0
    
    
    for n in t {
        if n == "p" {
            num1 += 1
        }else if n == "y" {
            num2 += 1
        }
    }
    if num1 == num2 {
        return true
    }else if num1 != num2 {
        return false
    }
    return true
}
strText(t: "pPPPy")

//nextSqaure함수는 정수 n을 매개변수로 입력받습니다.
//n이 임의의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 임의의 정수 x의 제곱이 아니라면 'no'을 리턴하는 함수를 완성하세요.
//예를들어 n이 121이라면 이는 정수 11의 제곱이므로 (11+1)의 제곱인 144를 리턴하고, 3이라면 'no'을 리턴하면 됩니다.
//
//func squareNum(n: Int) {
//    var x: Int =
//    if n / x == x {
//
//    }
//
//    if n == (x * x) {
//       return (x + 1) * (x + 1)
//    }
//}
//squareNum(n: 121)

//딕셔너리는 들어있는 값에 순서가 없지만, 키를 기준으로 정렬하고 싶습니다. 그래서 키와 값을 튜플로 구성하고, 이를 순서대로 리스트에 넣으려고 합니다.
//예를들어 {김철수:78, 이하나:97, 정진원:88}이 있다면 각각의 키와 값을

//func q1(dic: [String:Int]) -> [String:Int] {
//
//    var totalList: [String: Int] = dic
//    var list: [String:Int] = [:]
//
//    for (key, value) in totalList {
//        list = [key:value]
//        for
//    }
//    return totalList
//}
//q1(dic: ["김철수":78, "정하나":97, "이진원":88])

func addNumToString (num1: Int, num2: Int) -> String {
    let a = String(num1)
    let b = String(num2)
    return String(a + b)
}
print(addNumToString(num1: 3, num2: 5))
