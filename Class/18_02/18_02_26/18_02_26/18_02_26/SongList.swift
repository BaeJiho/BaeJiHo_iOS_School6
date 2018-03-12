//
//  SongList.swift
//  18_02_26
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct SongList {
    var songTitle: String
    var trackNum: Int
    var writer: String
    var playTime: Int
    var playTimeStr: String {
        return "00:00"
    }
    var playURL: String
    
    
    init?(dic:[String:Any]) {
        
        guard let title = dic["songTitle"] as? String else { return nil }
        guard let track = dic["trackNum"] as? Int else { return nil }
        guard let writer = dic["writer"] as? String else { return nil }
        guard let time = dic["playTime"] as? Int else { return nil }
        guard let url = dic["playURL"] as? String else { return nil }
        
        self.songTitle = title
        self.trackNum = track
        self.writer = writer
        self.playTime = time
        self.playURL = url
        
    }
}
