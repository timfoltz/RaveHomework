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
    
    var employees: [Employee] = []
    var skills: [Skill] = []
    var taskList: [Task] = []
    
    func createTeam() {
        let iOSDev: Skill = .iOSDeveloper
        let teamLead: Skill = .TechLead
        let uX: Skill = .Ux
        let qA: Skill = .QA
        employees = [
            Employee(skills: [iOSDev], payRate: .normal),
            Employee(skills: [teamLead], payRate: .high),
            Employee(skills: [uX], payRate: .normal),
            Employee(skills: [qA], payRate: .normal),
        ]
        for emp in employees {
            skills.append(contentsOf: emp.skills)
        }
    }
    
    func createWeeklyTask() {
        let teamTaskList = [
            Task(timeReq: 1, skillReq: .Ux),
            Task(timeReq: 2, skillReq: .QA),
            Task(timeReq: 3, skillReq: .iOSDeveloper),
            Task(timeReq: 5, skillReq: .iOSDeveloper),
            Task(timeReq: 10, skillReq: .AndroidDeveloper),
            Task(timeReq: 15, skillReq: .iOSDeveloper),
            Task(timeReq: 200, skillReq: .Architech),
        ]
        taskList.append(contentsOf: teamTaskList)
    }
    
    func printMoney() {
        let validTasks = taskList.filter { task in
            task.isValid
        }
        print("valid tasks",validTasks.count)
        let remainingTasks = validTasks.filter { task in
            task.isCompleted == false
        }
        print("remaining tasks",remainingTasks.count)
        while remainingTasks.count == 0 {
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        }
    }
    
    func hire(employee: Employee) {
        employees.append(employee)
    }
    
// Todo:
//    func accessTaskList(employee: Employee) {
//        if let _ = employee as? ProjectManager {
//
//            print("Accessing taskList")
//        } else {
//            print("You don't have access")
//        }
//    }
    
    
}
