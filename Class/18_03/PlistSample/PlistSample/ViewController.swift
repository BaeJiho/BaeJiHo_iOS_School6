//
//  ViewController.swift
//  PlistSample
//
//  Created by 배지호 on 2018. 2. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loadData = loadPlistData(fileName: "Sample")
        let dic = loadPlistForDoc(fileName: "Sample")
        let custom = MyUserDefault()
        custom.object(forKey: "Sample")
//        print(loadData["name"]!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlistData(fileName: String) -> [String: String] {
        if let path = Bundle.main.path(forResource: fileName, ofType: "plist") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                if let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String: String] {
                    return dic!
                }
            }
        }
        return [:]
    }
    
    func loadPlistForDoc(fileName: String) -> [String: String]? {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullPath = rootPath + "/" + fileName + ".plist"
        //번들 경로
        if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist") {
            if !FileManager.default.fileExists(atPath: fullPath) {
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
                //번들에 있는 데이터를 도큐먼트에 복사해야한다. -> copy
                //파일이 존재하지 않으면 실행
            }
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String: String] {
//            데이터 변경
            dic.updateValue("bae", forKey: "ID")
           let newData = try! PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try? newData.write(to: URL(fileURLWithPath: fullPath))
        }
        return nil
    }
    
    
    
}

//    func loadPlistData(fileName: String) -> [String: String] {
//        if let path = Bundle.main.path(forResource: fileName, ofType: "plist") {
//            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
//                if let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String: String] {
//                    return dic!
//                }
//            }
//        }
//        return [:]
//    }

//    func loadPlistData(fileName: String) -> Dictionary<String, String> {
//
//        if let path = Bundle.main.path(forResource: fileName, ofType: "plist") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path))
//                if let dic = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String: String] {
//                    return dic
//                }
//            } catch {
//                print("확인해봐 에러야;;;")
//            }
//        }
//        return [:]
//    }


