//
//  AlbumInfo.swift
//  18_02_26
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct AlbumInfo {
    var albumTitle: String
    var artist: String
    var genre: String
    
    init?(dic: [String:Any]) {
        guard let title = dic["albumTitle"] as? String else { return nil }
        guard let arti = dic["artist"] as? String else { return nil }
        guard let genre = dic["genre"] as? String else { return nil }
        
        self.albumTitle = title
        self.artist = arti
        self.genre = genre
    }
}
