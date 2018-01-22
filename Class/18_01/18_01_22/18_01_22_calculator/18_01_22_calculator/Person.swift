//
//  Person.swift
//  18_01_22_calculator
//
//  Created by 배지호 on 2018. 1. 22..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var major: String
    var gender: String
    
    var subject: [Subject] = []
    
    init(name: String, gender: String, major: String) {
        self.name = name
        self.gender = gender
        self.major = major
    }
    
    func addSubject(name: String,score: Int) {
        subject.append(Subject(name: name, score: score))
    }
    
    func setSubject(subjectDic:[String:Int]) {
        for (subName,subScore) in subjectDic {
            addSubject(name: subName, score: subScore)
        }
    }
    
    func power() -> Int {
        for subject in subject {
            if subject.name == "싸움" {
                return subject.score
            }
        }
        return 0
    }
    
    func getIQ() -> Int {
        for subject in subject {
            if subject.name == "수학" {
                return subject.score
            }
        }
        return 0
    }
}
