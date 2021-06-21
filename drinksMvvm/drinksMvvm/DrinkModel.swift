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
    
    let strDrink: String        // name maps to strDrink
    let strDrinkThumb: String   // imageURL maps to strDrinkThumb
    let idDrink: String
}
