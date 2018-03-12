//
//  DataCenter.swift
//  18_02_26_DataStudy
//
//  Created by 배지호 on 2018. 2. 26..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation

struct AlbumData {
    var info: AlbumInfo
    var list: [SongList]
    
    init?(dic: [String: Any]) {
        guard let info = dic["albumInfo"] as? [String: Any] else { return nil }
        guard let list = dic["songList"] as? [[String: Any]] else { return nil }
        
        self.info = AlbumInfo(dic: info)!
        var temp: [SongList] = []
        
        for song in list {
            if let song = SongList(dic: song) {
                temp.append(song)
            }
        }
        self.list = temp
    }
}

struct AlbumInfo {
    var albumTitle: String
    var artist: String
    var genre: String
    
    init?(dic: [String: Any]) {
        guard let title = dic["albumTitle"] as? String else { return nil }
        guard let artist = dic["artist"] as? String else { return nil }
        guard let genre = dic["genre"] as? String else { return nil }
        
        self.albumTitle = title
        self.artist = artist
        self.genre = genre
    }
}

struct SongList {
    var songTitle: String
    var writer: String
    
    init?(dic: [String: Any]) {
        guard let title = dic["songTitle"] as? String else { return nil }
        guard let writer = dic["writer"] as? String else { return nil }
        
        self.songTitle = title
        self.writer = writer
    }
}

