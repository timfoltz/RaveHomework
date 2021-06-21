//
//  DrinkModel.swift
//  drinksMvvm
//
//  Created by Luat on 6/15/21.
/// https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic

import Foundation

/// Get all fields
struct DrinkModel: Decodable {
    let drinks: [DrinkItem]
}

struct DrinkItem: Decodable {
    enum CodingKeys: String, CodingKey {
        case drinkName = "strDrink"
        case imageUrl = "strDrinkThumb"
        case idDrink
    }
    let drinkName: String        // name maps to strDrink
    let imageUrl: String   // imageURL maps to strDrinkThumb
    let idDrink: String
}
