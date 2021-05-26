//
//  MusicResponse.swift
//  MoreProtocols
//
//  Created by Luat on 5/25/21.
//
/// https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json
import Foundation

/// Get artistName, name, and releaseDate
struct MusicResponse: Codable {
    struct Feed: Codable {
//        let title: String
        struct Results: Codable {
            let artistName: String
            let releaseDate: String
            let name: String
        }
        var results: [Results]
    }
    var feed: Feed
}

