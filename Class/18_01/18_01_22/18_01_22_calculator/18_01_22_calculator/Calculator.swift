//
//  Calculator.swift
//  18_01_22_calculator
//
//  Created by 배지호 on 2018. 1. 22..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Calculator {
//  평균구하기
    func average(student:Person) {
        
        let list: [Subject] = student.subject
        var totalScore: Int = 0
        for n in list {
           totalScore += n.score
        }
        let average1 = Double(totalScore) / Double(list.count)
        
        print("\(student.name)는 전공은\(student.major) 평균은\(average1)입니다.")
    }
//  가장 싸움을 잘하는 아이는
    func jjang(_ student:Person...) {
        
        var jjangName: String = ""
        var maxPower: Int = 0
        
        for person in student {
            let challengerPower = person.power()
            
            //새로운 짱 등극
           if maxPower < challengerPower {
                maxPower = challengerPower
                jjangName = person.name
            }
        }
  print("이 구역의 짱은 \(jjangName)")
    }
    
    func genius(stu1:Person, stu2:Person) {
        let stu1IQ = stu1.getIQ()
        let stu2IQ = stu2.getIQ()
        
        var geniusPerson:Person?
        var diffScore: Int = 0
        if stu1IQ > stu2IQ {
            geniusPerson = stu1
            diffScore = stu1IQ - stu2IQ
        }else {
            geniusPerson = stu2
            diffScore = stu2IQ - stu1IQ
        }
        
        
        print("\(geniusPerson!.name)의 수학점수가\(diffScore)점 더 높기 때문에 더 똑똑합니다.")
    }
}
