//
//  ViewController.swift
//  Strings
//
//  Created by Luat on 5/17/21.
//

import UIKit

class ViewController: UIViewController {

    let tester = Tester.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tester.printPigLatin(word: "racecar")
        print("pally test")
        tester.isPalindrome(word: "racecar")
    }


}

