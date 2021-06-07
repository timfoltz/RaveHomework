//
//  FireViewController.swift
//  multipleSB
//
//  Created by Luat on 6/7/21.
//

import UIKit

class FireViewController: UIViewController {

    @IBAction func fireButton(_ sender: Any) {
        print("here")
        let sb = UIStoryboard(name: "Avatar", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "AvatarVC") as? AvatarViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
