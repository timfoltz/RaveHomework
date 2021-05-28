//
//  ViewController.swift
//  luke34
//
//  Created by Luat on 5/27/21.
//

import UIKit

class ViewController: UIViewController {

    let label1: UILabel = UILabel()
    let label2: UILabel = UILabel()

    let button = UIButton()
    /**
     let button = UIButton(type: .custom)
     button.setTitle("Next", for: .normal)
     button.setTitleColor(.white, for: .normal)
     button.backgroundColor = .blue
     button.contentEdgeInsets = UIEdgeInsets(
         top: 4,
         left: 6,
         bottom: 4,
         right: 6
     )
     */
    let url = URL(string: "https://swapi.dev/api/people/1")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configureLabel1()
        configureLabel2()
        configureButton()
    }

    func configureLabel1() {
        let labelLocation = CGRect(x: 10, y: 25, width: view.bounds.width - 20, height: 100)
        label1.frame = labelLocation
        label1.shadowColor = .orange
        label1.backgroundColor = .black
        label1.numberOfLines = 0
        label1.textColor = .white
        //.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
        label1.text = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text "
        view.addSubview(label1)
        label1.font = UIFont(name: label1.font.fontName, size: 45)
    }
    func configureLabel2() {
        let labelLocation = CGRect(x: 10, y: 145, width: view.bounds.width - 20, height: 100)
        label2.frame = labelLocation
        label2.backgroundColor = .blue
        label2.numberOfLines = 0
        
        label2.text = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text "
        view.addSubview(label2)
    }
    func configureButton() {
        let buttonLocation = CGRect(x: 10, y: 300, width: view.bounds.width - 20, height: 30)
        button.frame = buttonLocation
        button.backgroundColor = .green
        button.setTitle("Update Text", for: .normal)
        
        button.addTarget(self, action: #selector(triggerButton), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    struct SwapiResponse: Codable {
        let name: String
        let hair_color: String
    }
    
    @objc func triggerButton() {
        let task = URLSession.shared.dataTask(with: url) { [self] d,r,e in
            guard let data = d else { return }
            
            let decoder = JSONDecoder()
            let decoded = try! decoder.decode(SwapiResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.label1.text = "Name: " + decoded.name
                self.label2.text = "Hair Color: " + decoded.hair_color.uppercased()
            }
        }
        task.resume()
        
        print("button pressed")
    }

}

