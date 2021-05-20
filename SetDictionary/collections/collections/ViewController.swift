//
//  ViewController.swift
//  collections
//
//  Created by Luat on 5/20/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan

        let tester = Tester()
        let result = tester.findCommonNums(from: [1,2,3], and: [1,2,3])
        print(result)
    }


}

