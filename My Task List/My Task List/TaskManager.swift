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
}

class TaskManager: NSObject {
    var tasks = [task]()
    var tasksCompleted = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
        
    }
    
    func deleteTask(taskDeleted: Int!){
        tasks.removeAtIndex(taskDeleted)
    }
    
    func completeTask(taskCompleted: Int!){
        tasksCompleted.append(tasks[taskCompleted]);
    }
    
    
}
