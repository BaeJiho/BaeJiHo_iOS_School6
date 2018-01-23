//
//  Person.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var gender: String
    var major: String
    
    var subjects: [Subject] = []
    
    init(name: String, gender: String, major: String) {
        self.name = name
        self.gender = gender
        self.major = major
    }
    
//    func addSubject(name: String, score: Int) {
//        subjects.append(Subject(name: name, score: score))
//    }
    
    func setSubject(subjectDic: [String:Int]) {
        for (subName,subScore) in subjectDic {
            subjects.append(Subject(name: subName, score: subScore))
        }
        
    }
    
}
