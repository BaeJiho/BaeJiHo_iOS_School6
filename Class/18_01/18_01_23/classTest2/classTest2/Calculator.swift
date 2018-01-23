//
//  Calculator.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Calculator {
    
    func average(student: Person) {
        var list: [Subject] = student.subjects
        var totalScore: Int = 0
        var totalName: String = ""
        
        for n in list {
            totalScore += n.score
            totalName += n.name
        }
        let average = Double(totalScore) / Double(list.count)
        
        print("\(totalName)과목의 평균은 \(average)")
    }
//
//    func arrange(student: Person) {
//        let list: [Subject] = student.subjects
//
//        var index: Int = 0
//        var result: Int = 0
//
//        for n in list {
//
//        }
//        print(list)
//    }

    func genius(stu1: Person, stu2: Person) {
        
        let studend1 = stu1.subjects
        let studend2 = stu2.subjects
        
        var geniusName: String = ""
        var maxPower: Int = 0
        var challenger: Int = 0
        var diffScore: Int = 0
        
        for n in studend1 {
            if n.name == "수학" {
                maxPower = n.score
            }
        }
        
        for i in studend2 {
            if i.name == "수학" {
                challenger = i.score
            }
        }
        
        if maxPower > challenger {
            geniusName = stu1.name
            diffScore = maxPower - challenger
        }else {
            geniusName = stu2.name
            diffScore = challenger - maxPower
        }
        
        
    }
    
}
