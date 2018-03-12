//
//  MyUserDefault.swift
//  PlistSample
//
//  Created by 배지호 on 2018. 2. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

let deFaultsNames = "MyUserDefaults"

class MyUserDefault {
    
    
    let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    func object(forKey defaultName: String) -> Any? {
        let fullPath: String = rootPath + "/" + deFaultsNames + ".plist"
        if !FileManager.default.fileExists(atPath: fullPath) {
            
            return nil
        }
        return nil
    }
    
    func set(_ value: Any?, forKey defaultName: String) {
        let fullPath: String = rootPath + "/" + deFaultsNames + ".plist"
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)) {
            if var dic = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String: String]{
                dic.updateValue(value as! String, forKey: defaultName)
            }
        }
    }
    
    func removeObject(forKey defaultName: String) {
        
    }
    
}
