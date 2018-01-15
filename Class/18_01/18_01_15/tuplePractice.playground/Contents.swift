//: Playground - noun: a place where people can play

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

