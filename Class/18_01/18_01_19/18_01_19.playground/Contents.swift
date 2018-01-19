//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//func q6(num: Int) -> Int {
//    var firstNum: Int = 0
//    var secondNum: Int = 1
//
//    for _ in 1...num {
//        let temp = firstNum + secondNum
//        firstNum = secondNum
//        secondNum = temp
//    }
//    return firstNum
//}

func arrayTest() -> Bool {
    var list: [String] = ["My","name","is","Bae","ji","ho"]
    list.append(contentsOf: ["fastCamp","Doridori"])
    list.append("입니다.")
    
    list.insert("wow", at: 0)
    print(list)
    list.remove(at: 0)
    print(list)
    print(list[2...3])
    list.insert("wowo", at: 4)
    for text in list {
        print(text, " ")
    }
    print(list)
    print(list.count)
    list.removeAll()
    print(list)
    print(list.count)
    list.append("dododo")
    
    if list.isEmpty {
        return true
    }else {
        return false
    }
    
}
print(arrayTest())

func setTest() {
    let oddDigits: Set = ["1","3","5","7","9"]
    let evenDigits: Set = ["2","4","6","8"]
    let primeDigits: Set = ["2","3","5","7"]
    
    print("Go----------")
    
    let intersectList = oddDigits.intersection(oddDigits).sorted()
    print(intersectList)
    let differenceList = oddDigits.symmetricDifference(primeDigits).sorted()
    print(differenceList)
    let unionList = oddDigits.union(evenDigits).sorted()
    print(unionList)
    let subtractList = oddDigits.subtracting(primeDigits).sorted()
    print(subtractList)
}
print(setTest())

func dicTest() {
    //기본 딕셔너리
    var dic: [String:Any] = ["name":"BaeJiHo", "age":20, "job":"Student","isSingle":true]
    //딕셔너리 추가
    dic.updateValue("Seoul", forKey: "address")
    //딕셔너리 수정
    dic.updateValue("Jiho", forKey: "name")
    //삭제
    dic.removeValue(forKey: "isSingle")
    
    let introduce: String = "제 이름은" + (dic["name"] as! String) + "입니다."
    let doubleAge = (dic["age"] as! Int)
    
    print(introduce)
    print(doubleAge)
    
    for (key,value) in dic {
        print("key값은\(key)이고","value값은\(value)이다.")
    }
}
dicTest()
//배열
//Level 1
//시작과 끝수를 받아서 두 수 사이의 모든 수를 가지고 있는 배열 만들기
func q1(num: Int, num2: Int) -> [Int]{
    var result: [Int] = []
    
    for n in num...num2 {

        result.append(n)
    }
    return result
}
q1(num: 1, num2: 10)
//정수 타입의 배열을 입력받아 모든 배열의 수의 합을 리턴하는 함수

var num2: [Int] = [1,2,3,4,5,6]
func q2(num: [Int]) -> Int {
    var todo: Int = 0
    
    for n in  num2{
        todo += n
    }
    return todo
}
q2(num: num2)


//딕셔너리에 있는 모든 데이터 출력하는 함수 >> 데이터: ["name":"joo", "age":20, "job":"Developer"]

func q3() {
    let ddic: [String:Any] = ["name":"joo", "age":20, "job":"Developer"]
    for n in ddic {
        print(n)
    }
}
q3()

//Level 2
//정수 타입의 배열을 받아서 배열안의 중복된 수를 모두 제거된 배열을 반환하는 함수


var num3: [Int] = [1,1,2,2,3]

func q4(num: [Int]) -> [Int] {
    
    let num = num3
    var dicc: [Int] = []
    
    for n in num {
        if !(dicc.contains(n)){
            dicc.append(n)
        }
    }
    return dicc
}
q4(num: num3)

//정수 배열을 입력받아, 배열의 요소 중 두 개를 선택하는 조합을 모두 포함하는 배열을 작성하세요.
//>> [1, 2, 3] -> [[1, 2], [1, 3], [2, 3]]
var num4: [Int] = [1,2,3]

//func q5(num: [Int]) -> [Int] {
//    var dic: [Int] = []
//    let list = [Int](1...5)
//    var dic = Array(list.enumerated())
//    print(dic)
//    for n in num {
//        for n in num {
//            dic.append(n)
//        }
//        dic.append(n)
//    }
//    return dic
//}
//q5(num: num4)
//Level 3
//정수 타입의 배열을 입력받아서 오름차순으로 정렬된 배열을 만들어 리턴하시오.(정렬 함수 사용x)   (정렬의 효율은 보지 않습니다.)
//>>에라토스테체 알고리즘을 이용하여  입력된 숫자까지의 모든 소수의 배열을 반환하는 함수
////>>에라토스테체 알고리즘을 이용하여  입력된 숫자까지의 모든 소수의 배열을 반환하는 함수
//func idio(list: [Int]){
//let list = [Int](num4)
//let arrayOfDictionaries = list.enumerated().map { (a, b) in return [a , b] }
//print(arrayOfDictionaries) // prints [[0: 1], [1: 2], [2: 3], [3: 4], [4: 5]]
//}
func idio(list: [Int]){
    var ca4: [[Int]] = Array(count: 10, repeatedValue: Array(count: 10, repeatedValue: 0))
    print(ca4)}

idio(list: num4)
