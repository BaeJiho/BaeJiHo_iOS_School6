//
//  ViewController.swift
//  classTest2
//
//  Created by 배지호 on 2018. 1. 23..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baeJiHo = Person(name: "배지호", gender: "남자", major: "취준생")
        let dic = ["수학":90,"과학":90,"음악":60,"싸움":80]
        
        let wow = Person(name: "와우", gender: "여성", major: "취준생")
        var dicc = ["수학":90,"과학":90,"음악":60,"싸움":80]
        
        let jj = Student(grade: "A")
        
        wow.setSubject(subjectDic: dicc)
        baeJiHo.setSubject(subjectDic: dic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

