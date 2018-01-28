//
//  Student.swift
//  ThreeWeekTest
//
//  Created by 배지호 on 2018. 1. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Student: Person {
    
    var studentCheck: Int
    
    
    var sujectsDic: [String:Int] = [:]
    var subjects: [Subject] {
        get {
            var resultScore: [Subject] = []
            for (subName, subScore) in sujectsDic {
                resultScore.append(Subject(name: subName, score: subScore, student: studentCheck))
            }
            return resultScore
        }
        set {
            for subject in newValue {
                sujectsDic.updateValue(subject.score, forKey: subject.name)
            }
        }
    }
    
    init(name: String, gender: String, studentCheck: Int) {
        self.studentCheck = studentCheck
        super.init(name: name, gender: gender)
    }
    
    func mathValue() -> Int{
        for n in subjects {
            if n.name == "수학" {
                return n.score
            }
        }
        return 0
    }
}
