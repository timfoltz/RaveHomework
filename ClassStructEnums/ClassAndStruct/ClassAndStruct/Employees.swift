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
        self.skills = skills
        self.payRate = payRate
    }
    /**
     attempt(task: Task) -> Bool
         • Task can be attempted if employee has skillReq and timeReq
         • Add the hours required to finish task to employee's hoursWorked
         • 4/5 chances of succeeding
     
     */
    func attempt(task: Task) -> Bool {
         
            if Int.random(in: 1...5) == 3 {
                self.hoursWorked += task.timeReq
                task.isCompleted = true
                print("random complete")
                return true
            }else {
                self.hoursWorked += task.timeReq
                task.isCompleted = true
                print("complete")
                return true
            }
        }
    }


class ProjectManager: Employee {
    
    override init() {
        super.init()
        skills.append(.ProjectManager)
    }
    /**
     startTask()
          • go thru team's taskList and call validate and delegate tasks
     */
    func startTasks() {
        for task in Team.shared.taskList {
            print("checking task skill in team skills")
            validate(task: task)
        }
        for task in Team.shared.taskList {
            if task.isValid {
                for emp in Team.shared.employees {
                    if emp.skills.contains(task.skillReq) && emp.hoursWorked + task.timeReq <= 40 {
                        delegate(task: task)
                    }
                }
            }
        }
    }
    /**
     validate(task: Task) -> Bool
          • returns true if team member has reqSkill
          • set task property isValid to false if not valid
     
     */
    
    func validate(task: Task){
        if Team.shared.skills.contains(task.skillReq) {
            task.isValid = true
        } else {
            task.isValid = false
            print("task not in list of skills available")
        }
    }
    
    /**
     delegate(task: Task)
          • Give task to the first appropriate employee on the team
          • calls employee attempt(task:)
              - if successful, set task isCompleted to true
     */
    
    func delegate(task: Task) {
        print("deligating")
        if attempt(task: task) {
//            print("task complete")
        } else {
//            print("not complete")
        }
        }


}


