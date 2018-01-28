//
//  Calculator.swift
//  ThreeWeekTest
//
//  Created by 배지호 on 2018. 1. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Calculator {
    func average(student: Student){
        
        let list: [Subject] = student.subjects
        var totalScore: Int = 0
        
        for n in list {
            totalScore += n.score
        }
        
        let averageScore: Double = Double(totalScore) / Double(list.count)
        
        print("\(student.name)의 평균은 \(averageScore) 입니다.")
    }
    
    func compareScore(student1: Student, student2: Student) -> Int{
        let stu1 = student1.subjects
        let stu2 = student2.subjects
        var mathScoreOne: Int = student1.mathValue()
        var mathScoreTwo: Int = student2.mathValue()
        
        if mathScoreOne > mathScoreTwo {
            let compare = mathScoreOne - mathScoreTwo
            print("\(student1.name)의 수학점수가 \(compare)점 더 좋다")
            return student1.mathValue()
        }else if mathScoreTwo < mathScoreOne{
            let compareTwo = mathScoreTwo - mathScoreOne
            print("\(student2.name)의 수학점수가 \(compareTwo)점 더 좋다")
            return student2.mathValue()
        }else {
            print("둘다 점수가 같다.")
            return 0
        }
    }
}
