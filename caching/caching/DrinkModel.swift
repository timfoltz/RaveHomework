//
//  DrinkModel.swift
//  caching
//
//  Created by Luat on 6/4/21.
//

import Foundation

struct DrinkModel: Codable {
    let drinks: [DrinkItem]
}

struct DrinkItem: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
        case idDrink
    }
    
    let name: String
    let imageURL: String
    let idDrink: String
}
