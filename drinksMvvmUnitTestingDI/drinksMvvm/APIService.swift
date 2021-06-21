//
//  APIService.swift
//  drinksMvvm
//
//  Created by Luat on 6/17/21.
//

import Foundation

enum APIError: String, Error {
    case noNetwork
    case invalidURL
    case noData
    case errorDecoding
}

protocol APIServiceProtocol {
    func fetchDrinks(address: String, completion: @escaping (Result<DrinkModel?, APIError>) -> Void)
}

class DrinksAPIService: APIServiceProtocol {
    
    func fetchDrinks(address: String, completion: @escaping (Result<DrinkModel?, APIError>) -> Void) {
        let url = URL(string: address)!
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            
            guard let data = data else {
                print("error downloading")
                return
            }
            do {
                let decoded = try JSONDecoder().decode(DrinkModel.self, from: data)
                completion(.success(decoded))
                completion(.failure(.invalidURL))
                
            } catch {
                print("error decoding", error)
            }
        }.resume()
        
    }
}
