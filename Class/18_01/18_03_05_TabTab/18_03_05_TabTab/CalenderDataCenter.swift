//
//  CalenderDataCenter.swift
//  18_03_05_TabTab
//
//  Created by 배지호 on 2018. 3. 6..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation


struct calenderInfo{
    var year: Int
    var month: Int
    var day: Int
    
    private let calenderIns = Calendar(identifier: .gregorian)
    init?(date: Date) {
        var components = calenderIns.dateComponents([.year, .month, .day], from: date)
        year = components.year ?? 0
        month = components.month ?? 0
        day = components.day ?? 0
        components.day = 1
        
    }
}
