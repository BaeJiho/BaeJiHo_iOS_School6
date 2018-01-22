//
//  ViewController.swift
//  18_01_22_calculator
//
//  Created by 배지호 on 2018. 1. 22..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cal = Calculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mazingaZ = Person(name: "마징가Z", gender: "남성", major: "초딩")
        let dic = ["국어":80,"수학":60,"바른생활":97,"싸움":60]
        
        let dorian = Person(name: "도리안", gender: "여성", major: "중딩")
        let dicc = ["국어":90,"영어":70,"수학":93,"싸움":70]
        
        
        mazingaZ.setSubject(subjectDic: dic)
        dorian.setSubject(subjectDic: dicc)
        
        cal.average(student: mazingaZ)
        cal.genius(stu1: mazingaZ, stu2: dorian)
        cal.jjang(mazingaZ, dorian)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

