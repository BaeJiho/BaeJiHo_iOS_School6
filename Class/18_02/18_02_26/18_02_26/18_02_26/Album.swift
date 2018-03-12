//
//  Album.swift
//  18_02_26
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct Album {
    
    let albumInfo: AlbumInfo
    var songList: [SongList]
    
    init?(dictionary: [String: Any]) {
        guard let info = dictionary["albumInfo"] as? [String: Any] else { return nil }
        guard let list = dictionary["songList"] as? [[String: Any]] else { return nil }
        
        self.albumInfo = AlbumInfo(dic: info)!
        var temp: [SongList] = []
        for song in list {
            if let song = SongList(dic: song) {
                temp.append(song)
            }
        }
        self.songList = temp
    }
}
