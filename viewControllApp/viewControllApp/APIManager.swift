//
//  APIManager.swift
//  viewControllApp
//
//  Created by Luat on 6/1/21.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    func getData(completion: ((MusicModel) -> Void)?) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json") else {
            print("URL not valid")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error downloading data")
                return
            }
            guard error == nil else {
                // error is not nil, but still optional here
                if let error = error {
                    print("Error \(error.localizedDescription)")
                }
                return
            }
            // data exist here
            // error is nil here
            let decoder = JSONDecoder()
            do {
                let decodedModel = try decoder.decode(MusicModel.self, from: data)
                print(decodedModel)
//                self.musicModel = decodedModel
                completion?(decodedModel)
                
            } catch(let error) {
                print("Decoding error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
