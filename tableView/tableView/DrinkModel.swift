//
//  DrinkModel.swift
//  tableView
//
//  Created by Luat on 5/28/21.
//

import Foundation

struct DrinkModel: Decodable {
    let drinks: [DrinkItem]
}

struct DrinkItem: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
        case idDrink = "idDrink"
    }
    
    let name: String        // map back to strDrink
    let imageURL: String    // map back strDrinkThumb
    let idDrink: String
    
}

//  myDrinkItem.name
//  myDrinkItem.imageURL

/*
{
    "drinks": [
        {
        "strDrink": "3-Mile Long Island Iced Tea",
        "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
        "idDrink": "15300"
        },
     ]
}
*/
