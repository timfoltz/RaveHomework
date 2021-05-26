//
//  ShowResponse.swift
//  MoreProtocols
//
//  Created by Luat on 5/25/21.
//
/// http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones

import Foundation

/// Get name, summary, and genre
struct ShowResponse: Decodable {
    let name: String
    let summary: String
    let genres: [String]
}
