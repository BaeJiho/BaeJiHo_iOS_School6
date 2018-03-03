//
//  SingerInfo.swift
//  18_02_28_Study
//
//  Created by 배지호 on 2018. 2. 28..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct DataCenter {
    var album: AlbumInfo
    var song: [SongList]
    
    init?(dic: [String: Any]) {
        guard let al = dic["albumInfo"] as? [String: Any] else { return nil }
        guard let list = dic["songList"] as? [[String: Any]] else { return nil }
        self.album = AlbumInfo(dic: al)!
        var temp:[SongList] = []
        for sing in list {
            if let song = SongList(dic: sing) {
                temp.append(song)
            }
        }
        self.song = temp
    }
    
}

struct SongList {
    var songList: String
    var writer: String
    
    init?(dic: [String: Any]) {
        guard let list = dic["songList"] as? String else { return nil }
        guard let wri = dic["writer"] as? String else { return nil }
        
        self.songList = list
        self.writer = wri
    }
}


struct AlbumInfo {
    var albumTitle: String
    var artist: String
    var genre: String
    
    init?(dic: [String: Any]) {
        guard let title = dic["albumTitle"] as? String else { return nil }
        guard let arti = dic["artist"] as? String else { return nil }
        guard let gen = dic["genre"] as? String else { return nil }
        
        self.albumTitle = title
        self.artist = arti
        self.genre = gen
    }
}
