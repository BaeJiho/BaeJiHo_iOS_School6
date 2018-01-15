//
//  data.swift
//  ToolBox
//
//  Created by 배지호 on 2018. 1. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class DataKb {
    func changeDataKb(kb: Double) -> Double {
        
        if kb == 0 {
            return 0
        }else {
            return kb * 0.000977
        }
    }
}
