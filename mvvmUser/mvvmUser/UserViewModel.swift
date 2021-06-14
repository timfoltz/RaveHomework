//
//  UserViewModel.swift
//  mvvmUser
//
//  Created by Luat on 6/14/21.
//

import Foundation

class UserViewModel {
    var userModel: UserModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUIClosure?()
            }
        }
    }
    
    init() {
        fetchUser()
    }
    
    /// update Labels
    var updateUIClosure: (() -> Void)?
    
    func fetchUser() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let fetchedModel = UserModel(fname: "Tom", lname: "Terminator")
            self.userModel = fetchedModel
        }
    }
    
    var fullName: String {
        get {
            return "\(userModel?.fname ?? "") \(userModel?.lname ?? "")"
        }
    }
    
    var email: String {
        userModel?.email ?? ""
    }
    
    var accountValue: String {
        "\(userModel?.accountValue ?? 0)"
    }
    
    var location: String {
        userModel?.location ?? ""
    }

}
