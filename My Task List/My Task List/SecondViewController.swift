//
//  SecondViewController.swift
//  My Task List
//
//  Created by Lee Kangsik Kevin on 2/24/16.
//  Copyright © 2016 Lee Kangsik Kevin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtNumCompletedTasks: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Returning to view
    override func viewWillAppear(animated: Bool) {
        
        print("CompleteTasks RELOAD!")
        print(taskMgr.tasksCompleted)
        txtNumCompletedTasks.text = String(taskMgr.countCompletedTasks())
    }
    
    


}

