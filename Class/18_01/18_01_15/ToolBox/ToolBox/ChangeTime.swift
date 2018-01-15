//
//  ChangeTime.swift
//  ToolBox
//
//  Created by 배지호 on 2018. 1. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class ChangeTime {
    
    func changeToSecond(from time: Int) -> Int {
        
        var remainTime: Int = time
        
        let second: Int = remainTime % 100
        remainTime = remainTime / 100
        let min: Int = remainTime % 100
        remainTime = remainTime / 100
        let hour: Int = remainTime % 100
        
        return (hour * 3600) + (min * 60) + second
    }
}
