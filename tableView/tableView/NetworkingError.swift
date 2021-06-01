//
//  NetworkingError.swift
//  tableView
//
//  Created by Luat on 5/31/21.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String) //associated value of string
    case decodingError(err: String)
}
