//
//  ViewController.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    let myTeam = Team.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        myTeam.createTeam()
        myTeam.createWeeklyTask()
        
        // Create a project manager
        // Call projectManager.startTask() to start work
        
        // All valid tasks should be completed to print money
        // Print "BRRRRRR"
        
        myTeam.printMoney()
    }

/**
     Design
     1) Team (singleton class): Manages employees and tasks
     - Properties:
         • employees: [Employee]
         • taskList: [Task]
     - Functions
         • createWeeklyTasks() populate the team taskList
         • printMoney() should print money if all valid tasks are completed
     2) Employee
     - Properties:
         payRate: PayRate (enum)
         skills: [Skill] (enum)
         hoursWorked: Int
             • Can't work more than 40 hours a week
     - Functions
         attempt(task: Task) -> Bool
             • Task can be attempted if employee has skillReq and timeReq
             • Add the hours required to finish task to employee's hoursWorked
             • 4/5 chances of succeeding
     2b) ProjectManager: access and manages the team's taskList
     - Subclass of employee
     - Properties:
         taskList: [Task]
     - Functions
        startTask()
             • go thru team's taskList and call validate and delegate tasks
        validate(task: Task) -> Bool
             • returns true if team member has reqSkill
             • set task property isValid to false if not valid
        delegate(task: Task)
             • Give task to the first appropriate employee on the team
             • calls employee attempt(task:)
                 - if successful, set task isCompleted to true
     3) Task
     - Properties:
         timeReq: Int
         skillReq: Skill
         isCompleted: Bool
         isValid: Bool

     
*/
    
}

