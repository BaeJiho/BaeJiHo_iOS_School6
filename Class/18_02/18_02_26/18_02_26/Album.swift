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

