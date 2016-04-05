//
//  ViewController.swift
//  TaskIt
//
//  Created by Neil Houselander on 30/03/2016.
//  Copyright © 2016 Neil Houselander. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    //MARK: IBOutlets
   
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    
    var taskArray: [TaskModel] = []
    
    //Constants
    var kCellFontBig = UIFont(name: "Chalkduster", size: 20)
    let kCellFontSmall = UIFont(name: "Chalkduster", size: 14)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.blackColor()
        
        //hide unused cells - deafult way
        self.tableView.tableFooterView = UIView()
        
        //create the tasks
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs in the past & present", date: "5/04/2016")
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: "06/04/2016")
        let task3 = TaskModel(task: "Gym", subTask: "Leg day", date: "7/04/2016")
        
      
        self.taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITabelView DataSource Functions: This is where the data that populates the cell comes from
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentTask = self.taskArray[indexPath.row]
        print(indexPath.row)
        let cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        //cell label design
        cell.taskLabel.textColor = UIColor.whiteColor()
        cell.descriptionLabel.textColor = UIColor.yellowColor()
        cell.taskLabel.font = kCellFontBig
        cell.descriptionLabel.font = kCellFontSmall
        cell.dateLabel.font = kCellFontSmall
        
        //cell content
        cell.taskLabel.text = currentTask.task
        cell.descriptionLabel.text = currentTask.subTask
        cell.dateLabel.text = currentTask.date
        
        
        return cell
    }
    
    
    //MARK: UITableView Delegate Functions
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }
    


}

