//: Playground - noun: a place where people can play

import UIKit


var multiplyBy2 = sequence(first: 1) { $0 * 2}
if let multi = multiplyBy2.next() {
    print(multi)
}
print(multiplyBy2.next())
multiplyBy2.prefix(7).forEach{print($0)}

let repeatSeq = sequence(first: 5) { $0 }
for x in repeatSeq.prefix(5) {
    print(x)
}
