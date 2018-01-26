//: Playground - noun: a place where people can play

import UIKit

class AClass {
    
    var name: String = ""
}

let some = AClass()
let poo = some

some.name = "SeJun"

print(poo.name)


struct BStruct {
    var name: String
}

var test = BStruct(name: "JIho")
var copy = test

func test1(instace: BStruct) {
    var copy = instace
    copy.name = "changed"
}

test1(instace: test)
print(test.name)

func test2(name: inout String) {
    name = "changed"
}

test2(name: &test.name)
print(test.name)


var changeValue:Int = 0 {
    willSet {
        print("현재값은 \(changeValue)이고 곧 \(newValue)로 바뀔것이다.")
    }
    didSet {
        print("현재값은 \(changeValue)이고 바뀌기 전 값은 \(oldValue)이다.")
    }
    
    
}
changeValue = 4



