//
//  Person.swift
//  XcodeTest
//
//  Created by 배지호 on 2018. 1. 11..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class FruitStore {
    //직원
    var name: String = ""
    var age: Int = 0
    var city: String = ""
    //과일의 정의
    var fruitName: String = ""
    var taste: String = ""
    var origin: String = ""

    func work(){
        print("이번에 채용된 \(name)은 나이가 \(age)살이며, 살고있는 도시는 \(city)이다.")
    }
    func sell(money giveMeMoney: Int){
        print("\(name)는 \(fruitName)을 \(giveMeMoney)원 받고 손님한테 팔았다. \(fruitName)의 맛은\(taste)며, 원산지는 \(origin)이다.")
    }
    
}

