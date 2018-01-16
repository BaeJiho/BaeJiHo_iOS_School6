//: Playground - noun: a place where people can play

import UIKit

func area(width: Double, height: Double, redian: Double) -> Double {
    let compareData = (width, height, redian)
    var are: Double = 0.0
    
    switch compareData {
    case (let x, 0, 0):
        are = x * 4
    case (let x, let y, 0):
        are = x * y
    case (0, 0, let r):
        are = 3.14 * r
    case (0, let x, let y):
        are = 0.5 * ((2 * y) * x)
    default:
        are = 0
    }
    return are
}
print(area(width: 10, height: 0, redian: 6))

//switch-case
//월을 입력받아 해당월의 이름을 반환해주는 함수 (ex: 1 >>> "Jan", 12 >>> "Dec", 13 >> "Error"
//년/월을 입력받아 해당 들의 마지막 날을 반환 해주는 함수(윤년 고려)
//if문 변환
//시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")

//도형 부피 구하기 함수
//도형 넓이 구하기 함수

//월을 입력받아 해당월의 이름을 반환해주는 함수 (ex: 1 >>> "Jan", 12 >>> "Dec", 13 >> "Error"
func changeDay(day: Int) -> String {
    
    var change: String = String(day)
    
    switch change {
    case "1":
        change = "jan"
    case "2":
        change = "fev"
    case "3":
        change = "mar"
    case "4":
        change = "apr"
    case "5":
        change = "may"
    case "6":
        change = "jun"
    case "7":
        change = "july"
    case "8":
        change = "aug"
    case "9":
        change = "sep"
    case "10":
        change = "oct"
    case "11":
        change = "nov"
    case "12":
        change = "dec"
    default:
        print("Error")
    }
    return change
}

var dataDay = changeDay(day: 7)
print(dataDay)

//시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
func grade(of score: Int) -> String {
    
    var grade: String = "F"
    
    switch score {
    case 95...100:
        grade = "A+"
    case 85..<95:
        grade = "A"
    case 75..<85:
        grade = "B+"
    case 65..<75:
        grade = "B"
    default:
        grade = "F"
    }
    return grade
}

print(grade(of: 100))

func yearDay(year: Int) {
    
    if (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0){
        print("윤년")
    }else if (year % 4 == 0) && (year % 100 == 0){
        print("윤년이 아니다.")
    }else if (year % 4 == 0) {
        print("윤년")
    }
}
yearDay(year: 2016)


