//
//  ViewController.swift
//  ThreeWeekTest
//
//  Created by 배지호 on 2018. 1. 27..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cal: Calculator = Calculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        let bae = Student(name: "배지호", gender: "남성", studentCheck: 3)
        let haha = Student(name: "하하", gender: "남성", studentCheck: 3)
        bae.subjects = [
            Subject(name: "수학", score: 90, student: 2),
            Subject(name: "과학", score: 80, student: 3),
            Subject(name: "음악", score: 70, student: 2),
            Subject(name: "싸움", score: 60, student: 1),
        ]
        haha.subjects = [
            Subject(name: "수학", score: 63, student: 2),
            Subject(name: "과학", score: 80, student: 3),
            Subject(name: "음악", score: 70, student: 2),
            Subject(name: "싸움", score: 60, student: 1),
        ]
        
        cal.average(student: bae)
        cal.compareScore(student1: bae, student2: haha)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

