//
//  ViewController.swift
//  autoLayout
//
//  Created by Luat on 5/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var tealView: UIView!
    @IBOutlet weak var centerLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("here")
        
    }
    
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOutlet.setTitle("new title", for: .normal)
        label.text = "Testing"
        label.backgroundColor = .blue
        view.addSubview(label)
        
    }

}

