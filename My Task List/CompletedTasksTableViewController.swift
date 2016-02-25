//
//  CompletedTasksTableViewController.swift
//  My Task List
//
//  Created by Lee Kangsik Kevin on 2/25/16.
//  Copyright © 2016 Lee Kangsik Kevin. All rights reserved.
//

import UIKit

class CompletedTasksTableViewController: UITableViewController {

    @IBOutlet var ctblTasks: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    //Returning to view
    override func viewWillAppear(animated: Bool) {
        
        print("CompleteTasks RELOAD!")
        print(taskMgr.tasksCompleted)
        ctblTasks.reloadData();
    }
    
  
    //UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskMgr.tasksCompleted.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "test")
        
        cell.textLabel!.text = taskMgr.tasksCompleted[indexPath.row].name
        cell.detailTextLabel!.text = taskMgr.tasksCompleted[indexPath.row].desc
        
        return cell
    }
    

}
