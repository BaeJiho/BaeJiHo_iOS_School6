//
//  InchAndCm.swift
//  ToolBox
//
//  Created by 배지호 on 2018. 1. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class Inch {
    
    func changeInch(Inch: Double) -> Double {
        
        if Inch == 0 {
            return 0
        }else {
            return (Inch * 2.54)
        }
    }
    
}
