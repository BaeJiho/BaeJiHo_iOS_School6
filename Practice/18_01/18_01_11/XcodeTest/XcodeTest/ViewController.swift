//
//  ViewController.swift
//  XcodeTest
//
//  Created by 배지호 on 2018. 1. 11..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 이 함수는 테스트 함수 입니다.
        let store: FruitStore = FruitStore()
        store.name = "지호"
        store.age = 20
        store.city = "서울"
        
        store.fruitName = "귤"
        store.origin = "베트남"
        store.taste = "달"
        
        store.work()
        store.sell(money: 10000)
    }
}

