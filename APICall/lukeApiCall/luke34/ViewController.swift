//
//  ViewController.swift
//  luke34
//
//  Created by Luat on 5/27/21.
//

import UIKit

class ViewController: UIViewController {

    let label: UILabel = UILabel()
    let button: UIButton = UIButton()
    let url = URL(string: "https://api.chucknorris.io/jokes/random")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        configureLabel()
        configureButton()
    }

    func configureLabel() {
        let labelLocation = CGRect(x: 10, y: 10, width: view.bounds.width - 20, height: 100)
        label.frame = labelLocation
        label.backgroundColor = .red
        label.numberOfLines = 0
        label.text = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text "
        view.addSubview(label)
    }
    
    func configureButton() {
        let buttonLocation = CGRect(x: 10, y: 300, width: view.bounds.width - 20, height: 30)
        button.frame = buttonLocation
        button.backgroundColor = .red
        
        button.setTitle("Update Text", for: .normal)
        
        button.addTarget(self, action: #selector(triggerButton), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc func triggerButton() {
        let task = URLSession.shared.dataTask(with: url) { d,r,e in
            guard let data = d else { return }
            print(data) // decode with JSONDecoder
            
            let decodedJoke = try! JSONDecoder().decode(Joke.self, from: data)
            
            DispatchQueue.main.async {
                self.label.text = decodedJoke.value
            }
        }
        task.resume()
        
        print("button pressed")
    }

}

struct Joke: Decodable {
    let value: String
}
