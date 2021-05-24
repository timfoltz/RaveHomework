//
//  Task.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

class Task {

    let skillReq: Skill
    let timeReq: Int
    var isCompleted: Bool = false
    var isValid: Bool = true
    
    init(timeReq: Int, skillReq: Skill) {
        self.timeReq = timeReq
        self.skillReq = skillReq
    }
}
