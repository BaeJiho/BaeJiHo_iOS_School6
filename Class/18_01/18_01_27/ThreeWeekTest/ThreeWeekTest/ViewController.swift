//
//  ViewController.swift
//  ThreeWeekTest
//
//  Created by 배지호 on 2018. 1. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bae = Student(name: "배지호", gender: "남성", studentCheck: 3)
        bae.subjects = [
            Subject(name: "수학", score: 90, student: 1),
            Subject(name: "과학", score: 90, student: 3),
            Subject(name: "음악", score: 90, student: 2),
            Subject(name: "싸움", score: 80, student: 1),
        ]
        print(bae.sujectsDic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

