//
//  ProductStruct.swift
//  userCoreData
//
//  Created by Luat on 6/20/21.
//

import CoreData

struct ProductStruct: Decodable {
    let name: String
    let price: Double
    
    func createProductModel() -> ProductModel {
        let product = ProductModel(context: AppDelegate.viewContext)
        product.name = name
        product.price = price
        return product
    }
    
    
}
