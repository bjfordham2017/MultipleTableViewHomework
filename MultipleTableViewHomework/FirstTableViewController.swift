//
//  FirstTableViewController.swift
//  MultipleTableViewHomework
//
//  Created by Brent Fordham on 6/19/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation
import UIKit

class FirstTableViewController: UITableViewController {
    
    var taskList = [Task("Buy milk", by: Date()), Task("Pick up drycleaning", by: Date()), Task("Meet Wendy for lunch", by: Date()), Task("Walk the dog", by: Date()), Task("Dance like nobody's watching, because no one is", by: Date())]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = taskList[indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = "Due: \(dateFormatter.string(from: task.dueDate))"
        
        return cell
    }
}
