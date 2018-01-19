//: Playground - noun: a place where people can play

import UIKit

//윤년구하기
//윤년은 4년마다 O, 100년마다x, 400년마다 O
//    year % 4 == 0 >> 4년으로 나누어 떨어지는 해
//    year % 100 == 0 >> 100년으로 나누어 떨어지는 해
//    year % 400 == 0 >> 400년으로 나누어 떨어지는 해
//func isLeapYear(_ year: Int) -> Bool {
//    if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) {
//        return true
//    }else {
//        return false
//    }
//}
/// 월의 마지막 날을 구하는 함수
///
/// - Parameters:
///  - month:  구라혀는 달
///  - year: 2월일 경우 윤년의 계산을 위해 필요한 데이터
///  - Returns: 마지막 날
//func lastDay(of month: Int, year: Int) -> Int {
//    switch month {
//    case 1,3,5,7,8,10,12:
//        return 31
//    case 4,6,9,11:
//        return 30
//    case 2:
//        let lastDayOfFeb = isLeapYear(year) ? 29 : 28
//        return lastDayOfFeb
//    default:
//        return 31
//    }
//}
//lastDay(of: 2, year: 2014)

//여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
//func average(of aGrade: String, and bGrade: String, then cGrade: String) -> Double {
//    let sumPoint = point(of: aGrade) + point(of: bGrade) + point(of: cGrade)
//    let averageP = sumPoint / 3
//
//    return averageP
//}
//average(of: "A", and: "B", then: "A")
//
//func point(of grade: String) -> Double {
//    switch grade {
//    case "A+":
//        return 4.5
//    case "A":
//        return 4
//    case "B+":
//        return 3.5
//    case "B":
//        return 3
//    default:
//        return 1
//    }
//}
//
//func timesTable(_ times: Int) {
//    print("\(times)단")
//    var count: Int = 1
//    while count < 10 {
//        print("\(times) * \(count) = \(times * count)")
//        count += 1
//    }
//}
//timesTable(8)
//
//func triangular(_ num: Int) -> Int {
//    var count: Int = 1
//    var todo: Int = 0
//    if num >= 0{
//        while count < num + 1 {
//            todo += count
//            count += 1
//        }
//    }else {
//        return 0
//    }
//
//    return todo
//}
//print(triangular(1234))
//
//
//
//func addAll(num: Int) -> Int {
//    var count: Int = num
//    var todo: Int = 0
//    while count > 0{
//        let todo2 = count % 10
//        todo += todo2
//        count /= 10
//    }
//    return todo
//}
//print(addAll(num: 123))
//
//
//func revers(num: Int) -> Int {
//    var count: Int = num
//    var todo: String = ""
//    while count > 0{
//        let todo2 = count % 10
//        todo += String(todo2)
//        count /= 10
//    }
//    return Int(todo)!
//}
//revers(num: 5663)


//func timesTable(_ times: Int){
//    print("\(times)단")
//    for num in 1...9 {
//        print("\(times) * \(num) = \(times * num)")
//    }
//}
//timesTable(9)

//func timesTable(_ times: Int){
//    print("\(times)")
//
//    for num in 1...times {
//        print("\(num)")
//    }
//}
//timesTable(9)

//        sum % 2 == 0 라면 sum / 2을 저장하고
//        sum % 2 != 0 라면 ((sum * 3) + 1)

//func sumTime(_ numb: Int) -> Int{
//    var sum: Int = numb
//    var count: Int = 0
//
//    while sum != 1 {
//        if sum % 2 == 0 {
//            sum = sum / 2
//        }else {
//            sum = (sum * 3) + 1
//        }
//        count += 1
//        if count >= 500 {
//            return -1
//        }
//    }
//    return count
//}
//sumTime(6)
//

//func harshad(_ numb: Int) -> Bool {
//    var count: Int = numb
//    var todo: Int = 0
//    if numb >= 0{
//        while count > 0 {
//            let todo2 = count % 10
//            todo += todo2
//            count /= 10
//        }
//        return true
//    }else {
//        return false
//    }
//}
//
//harshad(1)
//
//정수 하나를 입력받아서 1부터 입력받은 수까지의 모든 수를 더한값을 반환해주는 함수 (ex: 10 >>> 55)
//정수 두개를 입력받아서 첫번째 수를 두번째 수의 횟수 만큼 곱한 값을 반환해주는 함수 (ex: 2,3 >>> 8 /// 3,3 >>> 27)
//    정수를 받아서 각 자리의 합을 반환해주는 함수(ex: 312 >>> 6)
//    정수 하나를 받아서 1부터 정수까지의 숫자중 짝수를 모두 출력해주는 함수
//    100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
//    정수 하나를 받아서 그 정수의 약수를 출력하는 함수
//    2 이상의 정수를 입력받아, 그 수가 소수인지 아닌지를 판별하는 함수
//    정수 하나를 입력받아서 입력받은 수 번째 피보나치 수를 반환하는 함수를 작성하세요. (ex: 3 >>> 2, 7 >>> 13)

//정수 하나를 입력받아서 1부터 입력받은 수까지의 모든 수를 더한값을 반환해주는 함수 (ex: 10 >>> 55)
func q1(num: Int) -> Int {
    var numb: Int = 0
    for n in 1...num {
        numb += n
    }
    return numb
}

q1(num: 4)

//정수 두개를 입력받아서 첫번째 수를 두번째 수의 횟수 만큼 곱한 값을 반환해주는 함수 (ex: 2,3 >>> 8 /// 3,3 >>> 27)

func q2(num1: Int, num2: Int) -> Int {
    var sum: Int = num1
    var jj = 1
    
    for _ in 1...num2 {
        jj *= sum
    }
    return jj
}
q2(num1: 3, num2: 3)

//    정수를 받아서 각 자리의 합을 반환해주는 함수(ex: 312 >>> 6)
//     123
func q3(num: Int) -> Int {
    var sum: Int = num
    var todo: Int = 0
    while sum > 0 {
        let sumn = sum % 10
        todo += sumn
        sum /= 10
    }
    return todo
}
q3(num: 5482)

//    정수 하나를 받아서 1부터 정수까지의 숫자중 짝수를 모두 출력해주는 함수

func q4(num: Int) {
    var sum: Int = num
    for n in 1...num {
        if n % 2 == 0 {
            print(n)
        }
    }
}
q4(num: 10)


//func harshad(_ numb: Int) -> Bool {
//    var count: Int = numb
//    var todo: Int = 0
//    while count > 0 {
//        let todo2 = count % 10
//        todo += todo2
//        count /= 10
//    }
//    if numb % todo == 0{
//        return true
//    }else {
//        return false
//    }
//}
//harshad(18)

