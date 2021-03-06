//
//  AddTaskViewController.swift
//  My Task List
//
//  Created by Lee Kangsik Kevin on 2/24/16.
//  Copyright © 2016 Lee Kangsik Kevin. All rights reserved.
//

import UIKit



class AddTaskViewController: UIViewController, UITextFieldDelegate{
    
    
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    @IBOutlet var saveBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    @IBAction func btnSaveTask_Clicked(sender: UIBarButtonItem){
        print("save btn clicked")
        taskMgr.addTask(txtTask.text!, desc: txtDesc.text!, createdAt: NSDate(), completedAt: nil)
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
       
       
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === saveBtn{
            print("save Item!!!")
            taskMgr.addTask(txtTask.text!, desc: txtDesc.text!, createdAt: NSDate(), completedAt: nil)
            //var task = task(txtTask.text!,txtDesc.text!, NSDate(), nil)
            
        }
    }
    
    //IOS Touch Functions
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    
    }
    
    //UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true
    }
    
    
    
    
}