//
//  DataMb.swift
//  ToolBox
//
//  Created by 배지호 on 2018. 1. 15..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

class DataMb {
    func changDataMb(mb: Int) -> Int {
        if mb == 0 {
            return 0
        }else {
            return (mb * 1024)
        }
    }
}
