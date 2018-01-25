//
//  ViewController.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   let cal = Calculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baeJiHo = Student(name: "배지호", gender: "남성", students: 3)
        let dic1 = ["수학":90,"과학":90,"음악":60,"싸움":80]
        
        let majingaZ = Student(name: "마징가", gender: "남성", students: 0)
        let dic2 = ["수학":90,"과학":90,"음악":60,"싸움":80]
        
        let tang = Student(name: "탕", gender: "남성", students: 3)
        let dic3 = ["수학":90,"과학":90,"음악":60,"싸움":80]
        
        let pang = Student(name: "팡", gender: "남성", students: 1)
        let dic4 = ["수학":90,"과학":90,"음악":60,"싸움":80]

        baeJiHo.setSubject(subjectDic: dic1)
        majingaZ.setSubject(subjectDic: dic2)
        tang.setSubject(subjectDic: dic3)
        pang.setSubject(subjectDic: dic4)
        
        cal.average(student: baeJiHo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }





}
