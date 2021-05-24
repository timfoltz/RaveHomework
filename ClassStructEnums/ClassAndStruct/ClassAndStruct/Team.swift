//
//  Company.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation


class Team {
    private init() {}
    static let shared = Team()
    static var employees: [Employee] = []
    
    static func hire(employee: Employee) {
        employees.append(employee)
    }
    
    static func createReqTasks() -> [Task] {
        return []
    }
    
}
