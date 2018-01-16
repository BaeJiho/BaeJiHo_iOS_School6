//: Playground - noun: a place where people can play

import UIKit

func average(score:Int) {
    
    if(95 <= score && score <= 100) {
        print("A+")
    }else if(90 <= score && score <= 95) {
        print("A")
    }else if(85 <= score && score <= 90) {
        print("B+")
    }else if(80 <= score && score <= 85) {
        print("B")
    }
}

func grade(score: Double) -> Double{
    
    if score >= 100 {
        if(95 <= score && score <= 100) {
            print("A+")
        }else if(90 <= score && score <= 95) {
            print("A")
        }else if(85 <= score && score <= 90) {
            print("B+")
        }else if(80 <= score && score <= 85) {
            print("B")
        }else {
            print("f")
        }
    }
    return score
}
let myGrade: String = String(grade(score: 80))
