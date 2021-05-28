//
//  DrinkResponse.swift
//  MoreProtocols
//
//  Created by Luat on 5/25/21.
//
/// https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic

import Foundation

/// Get all fields
struct DrinkResponse: Decodable {
<<<<<<< HEAD
    let drinks: [[String:String]]
=======
    let drinks: [DrinkItem]
}

struct DrinkItem: Decodable {
    
    enum MyCustomKeys: String, CodingKey {
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
        case idDrink
    }
    
    let name: String        // name maps to strDrink
    let imageURL: String   // imageURL maps to strDrinkThumb
    let idDrink: String
>>>>>>> 7975a4112af1dd70038ccea2b5b46663e3a280c6
}

//myDrink.name
//myDrink.imageURL

//strDrink": "1-900-FUK-MEUP",
//"strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/uxywyw1468877224.jpg",
//"idDrink": "15395"
