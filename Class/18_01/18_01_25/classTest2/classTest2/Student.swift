//
//  Student.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Student:Person {
    
    var students = 0
    var subjects: [Subject] = []
    var grade: Bool = false
    
    init(name: String, gender: String, students: Int) {
        self.students = students
        if students == 3{
            self.grade = true
        }
        super.init(name: name, gender: gender)
    }
    
    func setSubject(subjectDic: [String:Int]) {
        for (subName,subScore) in subjectDic {
            
            subjects.append(Subject(name: subName, score: subScore, isHasGrade: grade))
        }
    }
    
    func getMathScore() -> Int{
        var score: Int = 0
        for n in subjects {
            if n.name == "수학" {
                score = n.score
            }
        }
        return score
    }
    
    
    func convertToGrage(at: Double) -> String {
        
        switch at {
        case 90..<100:
            return "A+"
        default:
            return "F"
        }
    }

}
