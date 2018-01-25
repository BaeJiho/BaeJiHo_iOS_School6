//
//  Calculator.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Calculator {
    
    func average(student: Student) {
        let list: [Subject] = student.subjects
        student.getMathScore()
        var totalScore: Int = 0
        var totalName: String = ""
        
        for n in list {
            totalScore += n.score
            totalName += n.name
        }
        let average = Double(totalScore) / Double(list.count)
        
        print("\(totalName)과목의 평균은 \(average)")
    }
    
    func univerAverage(student: Student) -> String? {
        guard student.students == 3 else{
            return nil
        }
        let list: [Subject] = student.subjects
        var total: String = ""
        var totalScore: Int = 0

        for n in list {
            totalScore += n.score
        }
        var average = Double(totalScore) / Double(list.count)
        let result = student.convertToGrage(at: average)
        return result
    }
    

    

//    func genius(stu1: Student, stu2: Student) {
//
//        let student1 = stu1.subjects
//        let student2 = stu2.subjects
//
//        var geniusName: String = ""
//        var math1: Int = stu1.getMathScore()
//        var math2: Int = stu2.getMathScore()
//        var diffScore: Int = 0
//
//        if math1 > math2 {
//            geniusName = stu1.name
//            diffScore = math1 - math2
//        }else {
//            geniusName = stu2.name
//            diffScore = math2 - math1
//        }
//    }
}

