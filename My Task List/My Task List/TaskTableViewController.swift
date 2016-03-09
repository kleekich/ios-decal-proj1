//
//  TaskTableViewController.swift
//  My Task List
//
//  Created by Lee Kangsik Kevin on 2/24/16.
//  Copyright © 2016 Lee Kangsik Kevin. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    @IBOutlet var tblTasks: UITableView!
    var newTask: task = task(name:"",desc:"",createdAt:nil,completedAt: nil)
    
    let lightOrange : UIColor = UIColor(red: 0.99, green: 0.467, blue: 0.224, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        tblTasks.reloadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    //Returning to view
    override func viewWillAppear(animated: Bool) {
        
        print("RELOAD!")
        print(taskMgr.tasks)
        //tblTasks.reloadData();
    }

    //UITableView Delete
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMgr.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
    }
    /*
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
    
    }
*/
    
    

    
    //UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskMgr.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath)
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "ToDoCell")
        let currTask = taskMgr.tasks[indexPath.row]
        if((currTask.completedAt) != nil){
            cell.detailTextLabel!.textColor = UIColor.whiteColor()
            cell.contentView.backgroundColor = lightOrange
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            let myDateFormatter : NSDateFormatter = NSDateFormatter()
            myDateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            cell.textLabel!.text = currTask.name
            cell.detailTextLabel!.text = myDateFormatter.stringFromDate(currTask.completedAt!)
            
            return cell
        }
        cell.textLabel!.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text = taskMgr.tasks[indexPath.row].desc

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let selectedCell: UITableViewCell! = tableView.cellForRowAtIndexPath(indexPath)
        //colors
        selectedCell.detailTextLabel!.textColor = UIColor.whiteColor()
        selectedCell.contentView.backgroundColor = lightOrange
        selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        //setup detail view
        let myDate : NSDate = NSDate()
        let myDateFormatter : NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        selectedCell.detailTextLabel!.text = myDateFormatter.stringFromDate(myDate)
        
        //change data
        //if(taskMgr.tasks[indexPath.row].completedAt == nil){
            taskMgr.completeTask(indexPath.row)
        //}

    }
    
    @IBAction func unwindToTaskTableView(segue: UIStoryboardSegue) {
        if segue.identifier == "save" {
        }
        
        if let avc = segue.sourceViewController as? AddTaskViewController {
            taskMgr.addTask(avc.txtTask.text!, desc: avc.txtDesc.text!, createdAt: NSDate(), completedAt: nil)
            
        }
        
    }
    /*
    @IBAction func addTaskToTableView(segue: UIStoryboardSegue) {
    tblTasks.reloadData();
    
    }
    */


}
