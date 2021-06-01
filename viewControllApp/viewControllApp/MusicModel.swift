//
//  MusicModel.swift
//  viewControllApp
//
//  Created by Luat on 6/1/21.
//

import Foundation

struct MusicModel: Decodable {
    let feed: FeedItem
}

struct FeedItem: Decodable {
    let results: [SongDetails]
}

struct SongDetails: Decodable {
    let artistName: String
}

