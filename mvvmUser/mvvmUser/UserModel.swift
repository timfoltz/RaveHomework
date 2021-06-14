//
//  UserModel.swift
//  mvvmUser
//
//  Created by Luat on 6/14/21.
//

import Foundation

struct UserModel {
    let fname: String
    let lname: String
    let email: String
    let location: String
    let accountValue: Double
    
    init(fname: String, lname: String) {
        self.fname = fname
        self.lname = lname
        email = "placeholder@gmail.com"
        location = "No location yet"
        accountValue = 0
    }
}
