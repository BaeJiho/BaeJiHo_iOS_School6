//
//  main.swift
//  18_03_12
//
//  Created by 배지호 on 2018. 3. 12..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

print("Hello, World!")

class Person {
    let name: String = "배지호"
    let age: Int = 28
    
}

extension Person: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        return "myDescription: \(self.name), \(self.age)"
        
    }
    
    var debugDescription: String {
        return "myDescription"
    }
    
}


final class Person1: LosslessStringConvertible {
    var description: String
    
    init?(_ description: String) {
        self.description = description
    }
    
    let name: String = "배지호"
    let age: Int = 28
}
struct Dog {
    let age = 1
}
let dog = Dog()
print(String(describing: dog))

struct Cat: LosslessStringConvertible {
    let age = 1
    let description: String
    init?(_ description: String) {
        self.description = description
    }
}

let cat = Cat("I'm a cat")!
print(String(cat))
