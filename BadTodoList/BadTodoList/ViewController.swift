//
//  ViewController.swift
//  BadTodoList
//
//  Created by Alex Nichol on 6/8/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {
  
  var tasks : String[] = []
  @IBOutlet var tableView : UITableView
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var myValue : Int? = "hey".toInt()
    var theValue : Int! = "hey".toInt()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
    if !cell {
      cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
    }
    cell.textLabel.text = tasks[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
    return true
  }
  
  func tableView(tableView: UITableView!, commitEditingStyle style: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
    if style != .Delete {
      return
    }
    tasks.removeAtIndex(indexPath.row)
    tableView.beginUpdates()
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    tableView.endUpdates()
  }
  
  @IBAction func addPressed(AnyObject?) {
    var alert = UIAlertView()
    alert.title = "Add Item"
    alert.message = "Enter the content of your item"
    alert.addButtonWithTitle("Cancel")
    alert.addButtonWithTitle("OK")
    alert.alertViewStyle = .PlainTextInput
    alert.delegate = self
    alert.show()
  }
  
  func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
    if buttonIndex != 1 {
      return
    }
    tasks.append(alertView.textFieldAtIndex(0).text)
    tableView.reloadData()
  }

}

