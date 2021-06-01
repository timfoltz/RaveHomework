//
//  DrinkAPIManager.swift
//  tableView
//
//  Created by Luat on 5/31/21.
//

import Foundation

class DrinkAPIManager: APIManager {
    
    static let shared = DrinkAPIManager()
    private init () {}
    
    var urlString = ""
    
    func setURLResource(urlString: String) {
        self.urlString = urlString
    }
    
    // func getData() implemented by protocol extension
    
}

protocol APIManager {
    var urlString: String { get }
    func getDataParseJSON<MyModel: Decodable>(completion: @escaping (MyModel?) -> Void) -> Void
}

extension APIManager {
    func getDataParseJSON<MyModel: Decodable>(completion: @escaping (MyModel?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error creating url from address")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error downloading data")
                return
            }
            do {
                let decodedDrinks = try JSONDecoder().decode(DrinkModel.self, from: data)
                completion(decodedDrinks as? MyModel)
            } catch (let error) {
                print(error.localizedDescription, "error Decoding data")
            }
        }
        task.resume()
    }
}
