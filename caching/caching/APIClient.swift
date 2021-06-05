//
//  APIClient.swift
//  caching
//
//  Created by Luat on 6/4/21.
//

import Foundation

struct APIClient {
    let drinkAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
    
    static let shared = APIClient()
    
    func downloadData<T: Codable>(completion: @escaping (T?) -> Void) {
        print("calling API")
        URLSession.shared.dataTask(with: URL(string: drinkAddress)!) { (data,_,_) in
            guard let data = data else { return }
            if let decoded = try? JSONDecoder().decode(DrinkModel.self, from: data) {
                completion(decoded as? T)
                try? DiskCacheManager().cache(item: decoded)
            }
        }.resume()
    }
    
    
    
}
