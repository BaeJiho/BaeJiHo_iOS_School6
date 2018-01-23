//
//  Student.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Student:Person {
    
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init(name: "", gender: "", major: "")
    }
    
    func printName() {
        print(name)
    }
}
