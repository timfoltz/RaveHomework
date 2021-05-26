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
        print(musics ?? "")
        
// Todo: get any reponse, passing in fileName
//        let models: JokeResponse? = getAnyResponse(fileName: "JokeResponse")
//        print(models ?? "")

    }
    
    func getJokes() -> JokeResponse? {
        /// Getting path to file
        let bundlePath = Bundle.main.path(forResource: "JokeResponse", ofType: "json")
        
        /// Getting DATA type from the string in that file
        let jsonData = try! String(contentsOfFile: bundlePath!).data(using: .utf8)
        print("jsonData", jsonData!)
        
        /// Decoding from DATA type to a custom struct
        let decoder = JSONDecoder()
        let jokes = try! decoder.decode(JokeResponse.self, from: jsonData!)
        
        return jokes
    }
    
    /// All these functions are very similar...
    func getShows() -> ShowResponse? {
        return nil
    }
    
    func getDrinks() -> DrinkResponse? {
        return nil
    }
    
    func getMusics() -> MusicResponse? {
        return nil
    }
    
    func getAnyResponse(fileName: String) {
    }

}

