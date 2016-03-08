//
//  TaskManager.swift
//  My Task List
//
//  Created by Lee Kangsik Kevin on 2/24/16.
//  Copyright © 2016 Lee Kangsik Kevin. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task{
    var name = "Un-named"
    var desc = "Un-Described"
    var createdAt: NSDate
    var completedAt: NSDate?
}

class TaskManager: NSObject {

    var tasks = [task]()
    var tasksCompleted = [task]()
    
    func addTask(name: String, desc: String, createdAt: NSDate, completedAt: NSDate?){
        tasks.append(task(name: name, desc: desc, createdAt: createdAt, completedAt: completedAt))
        
    }
    
    func deleteTask(taskDeleted: Int!){
        tasks.removeAtIndex(taskDeleted)
    }
    
    func completeTask(taskCompleted: Int!){
        print("Completed a task!")
        tasks[taskCompleted].completedAt = NSDate()
        tasksCompleted.append(tasks[taskCompleted]);
        
    }
    
    
    
    
}
