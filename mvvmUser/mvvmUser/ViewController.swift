//
//  ViewController.swift
//  mvvmUser
//
//  Created by Luat on 6/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var accountValueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var userViewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVM()
    }
    
    func setupVM() {
        userViewModel = UserViewModel()
        print(userViewModel)
        
        userViewModel.updateUIClosure = { [weak self] in
            guard let wself = self else { return }
            wself.fullNameLabel.text = wself.userViewModel.fullName
            wself.emailLabel.text = wself.userViewModel.email
            wself.accountValueLabel.text = wself.userViewModel.accountValue
            wself.locationLabel.text = wself.userViewModel.location
        }
        print(userViewModel.fullName)
    }
    
    deinit {
        print("de init called")
    }
    
}

