//
//  Cm.swift
//  ToolBox
//
//  Created by 배지호 on 2018. 1. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Centimiter {
    
    func changeCm(Cm: Double) -> Double {
        
        if Cm == 0 {
            return 0
        }else {
            return (Cm * 0.393701)
        }
    }
}
