//
//  Subject.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct Subject {
    var name: String
    var score: Int
    
    var grade: String?
    
    init(name: String, score: Int, isHasGrade: Bool) {
        self.name = name
        self.score = score
        
        if isHasGrade {
            makeGrade()
        }
    }
    
    mutating func makeGrade() {
 
            switch (self.score) {
            case 90...100:
                self.grade = "A+"
            case 80..<90:
                self.grade = "A"
            case 70..<80:
                self.grade = "B+"
            case 60..<70:
                self.grade = "B"
            default:
                self.grade = "F"
            }
 
    }
}
