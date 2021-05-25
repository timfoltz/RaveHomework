//
//  Employees.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

class Employee {
    var payRate: PayRate = .normal
    var skills: [Skill] = []
    var hoursWorked: Int = 0
    
    init() {}
    init(skills: [Skill], payRate: PayRate) {
        // Your code here
    }
    
    func attempt(task: Task) -> Bool {
        return false
    }
}

class ProjectManager: Employee {
    
    override init() {
        super.init()
        skills.append(.ProjectManager)
    }
    
    func startTasks() {
        
    }
    
    func validate(task: Task) -> Bool {
        return true
    }
    
    func delegate(task: Task) {
        
    }
    
}
