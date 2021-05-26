//
//  ChuckNorrisJoke.swift
//  MoreProtocols
//
//  Created by Luat on 5/25/21.
//
/// https://api.chucknorris.io/jokes/random
import Foundation

/// Get icon_url and value 
struct JokeResponse: Decodable {
    let icon_url: String
    let value: String
}
