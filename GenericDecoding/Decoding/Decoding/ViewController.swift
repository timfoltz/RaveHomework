//
//  ViewController.swift
//  Decoding
//
//  Created by Luat on 5/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jokes = getJokes()
        print(jokes?.value ?? "")
        
        let shows = getShows()
        print(shows ?? "")
        
        let drinks = getDrinks()
        print(drinks ?? "")
        
        let musics = getMusics()
//        print(musics ?? "")
        let newMusic = musics.results
        for x in newMusic {
            print(x.name, x.artistName, x.releaseDate)
            }
            
        }
        
// Todo: get any reponse, passing in fileName
//        let models: JokeResponse? = getAnyResponse(fileName: "JokeResponse")
//        print(models ?? "")

    }
    let decoder = JSONDecoder()
    
    func getJokes() -> JokeResponse? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: "JokeResponse", ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
//        let decoder = JSONDecoder()
        let jokes = try! decoder.decode(JokeResponse.self, from: jsonData!)
        
        return jokes
    }
    
    /// All these functions are very similar...
    func getJokesFromAPI(completion: @escaping (JokeResponse) -> Void) {
        let url = URL(string: Constants.jokeAddress)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { fatalError() }
            
            let decoder = JSONDecoder()
            let decodedDrinks = try! decoder.decode(JokeResponse.self, from: data)
            
            completion(decodedDrinks)
            
        }
        task.resume()
    }
    
    func getShows() -> ShowResponse? {
        let bundlePath = Bundle.main.path(forResource: "ShowResponse", ofType: "json")
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        let shows = try! decoder.decode(ShowResponse.self, from: jsonData!)
        return  shows
    }
    
    func getDrinks() -> DrinkResponse? {
        let bundlePath = Bundle.main.path(forResource: "DrinkResponse", ofType: "json")
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        let drinks = try! decoder.decode(DrinkResponse.self, from: jsonData!)
        return drinks
    }
    
    func getMusics() -> MusicResponse.Feed {
        let bundlePath = Bundle.main.path(forResource: "MusicResponse", ofType: "json")
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        let shows = try! decoder.decode(MusicResponse.self, from: jsonData!)
        return shows.feed
    }
    
<<<<<<< HEAD
//    func getAnyResponse(fileName: String) {
//        let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json")
//        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
//        print("jsonData", jsonData!)
//        let response = try! decoder.decode(fileName.self, from: jsonData!)
//        return response
//    }

=======
    func getAnyResponse<T: Decodable>(fileName: String) -> T? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
        let decoder = JSONDecoder()
        let jokes = try! decoder.decode(JokeResponse.self, from: jsonData!)
        
        guard let jokes = jokes as? T else { return nil }
        return jokes
    }
>>>>>>> 7975a4112af1dd70038ccea2b5b46663e3a280c6


enum CustomError {
    case noData
}

