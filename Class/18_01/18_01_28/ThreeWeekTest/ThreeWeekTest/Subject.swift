//
//  Subject.swift
//  ThreeWeekTest
//
//  Created by 배지호 on 2018. 1. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct Subject {
    var name: String
    var score: Int
    
    var grade: String?
    
    
    init(name: String, score: Int, student: Int) {
        self.name = name
        self.score = score
        if student == 3 {
            makeScore()
        }
    }
    
    mutating func makeScore() {
        switch self.score {
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
