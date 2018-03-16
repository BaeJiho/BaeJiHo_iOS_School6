//
//  ViewController.swift
//  18_03_15
//
//  Created by 배지호 on 2018. 3. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - properties
    private let tmpDir = NSTemporaryDirectory()
    private let filePath = NSTemporaryDirectory() + "swift.txt"
    private let errorFilePath = NSTemporaryDirectory() + "noFile.txt"
    
    //MARK: - possible error types declaration
    enum MyError: Error {
        case errorExample
        case errorWithParam(num: Int)
    }
    
    //MARK: - sample script
    override func viewDidLoad() {
        super.viewDidLoad()
        createDummyFile()
        
        //handles error in many ways
        //    basic()
        //    threeTypesOfTry()
        throwsFunctionExample()
    }
    
    private func createDummyFile() {
        let swiftStr = "Swift Error Handling"
        try? swiftStr.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
    
    //MARK: - handles error here
    //MARK: basic error handling
    private func basic() {
        print("\n-----------[basic error handling]----------\n")
        let swiftStr = "swift Error Handling"
        do {
            try swiftStr.write(toFile: tmpDir, atomically: true, encoding: .utf8) // error: tmp is directory
            // do 안에서는 try?를 해서 뒷줄을 타게끔 할수도 있다
            // 에러 아님, 근데 윗줄에서 에러나서 do를 벗어나버림
            try swiftStr.write(toFile: filePath, atomically: true, encoding: .utf8)
            
        } catch { // "let error"가 기본 제공됨
            print (error)
            print (error.localizedDescription) // mac system language
        }
    }
    //MARK: error handling with tries
    private func threeTypesOfTry() {
        print("\n-----------[many tries]-------------\n")
        // 1. try
        do {
            let contentsDoCatch = try String(contentsOfFile: filePath)
            print(contentsDoCatch)
        } catch {
            print (error)
        }
        
        // 2. try?
        let contentsOptional = try? String(contentsOfFile: filePath)
        print(contentsOptional ?? "0")
        
        // 3. try!
        let contentsUnwrapped = try! String(contentsOfFile: filePath)
        print(contentsUnwrapped)
    }
    
    //MARK: error handling with patternMatching
    private func throwsFunctionExample() {
        print("\n-----------[throwsFunctionExample]-------------\n")
        print("\n-----------[NSError]-------------\n")
        do {
            try throwNSError()
        } catch {
            print("Error: \(error), LocalizedDescription: \(error.localizedDescription)")
            
            let e = error as NSError
            print("nsError: \(e), domain: \(e.domain), code: \(e.code), userInfo: \(e.userInfo)")
        }
        
        print("\n------------[customError]------------\n")
        do {
            try throwError()
        } catch let err {
            print("Error: \(err), LocalizedDescription: \(err.localizedDescription)")
            
            let e = err as NSError
            print("nsError: \(e), domain: \(e.domain), code: \(e.code), userInfo: \(e.userInfo)")
        }
        
        print("\n------------[ matching error ]------------\n")
        do {
            try throwError()
        } catch MyError.errorExample {
            print("errorExample")
        } catch MyError.errorWithParam(let num) {
            print("error with number param: \(num)")
        } catch {
            print("this error is not MyError")
        }
    }
    
    //MARK: - throwing error
    private func throwNSError() throws {
        throw NSError(domain: "domain data", code: 55, userInfo: ["something": 1])
    }
    
    private func throwError() throws {
        try "1".write(toFile: tmpDir, atomically: true, encoding: .utf8)
        throw MyError.errorWithParam(num: 10)
    }
    
    private func rethrowsFunctionExample() {
        someRethrowsFuncion {} // ok
        
        // Need to error handling
        do {
            try someRethrowsFuncion {
                
            }
        } catch <#pattern#> {
            <#statements#>
        }
    }
    
    private func someRethrowsFuncion(_ fn: () throws -> ()) rethrows {
        try fn()
    }
    
    private func deferOrder() {
        print("\n------[deferOrder]--------\n")
        print("start")
        defer { print("start1") }
        print("center")
        defer { print("start2") }
        defer { print("start3") }
        print("end")
    }
    
    private func deferExample() {
        print("\n------[deferExample]--------\n")
        defer {print("task1 - Must do something defore return")}
        do {
            try throwError()
        } catch {
            print(error)
            return
        }
        
        print("This is not called when error occurred")
        defer{print("This is not called when error occurred")}
    }
    
}


