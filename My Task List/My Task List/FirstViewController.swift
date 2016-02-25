//
//  FirstViewController.swift
//  My Task List
//
//  Created by Lee Kangsik Kevin on 2/24/16.
//  Copyright © 2016 Lee Kangsik Kevin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }

    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "test")
        
        cell.textLabel!.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }
    

}

