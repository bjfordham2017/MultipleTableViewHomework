//
//  ThirdTableViewController.swift
//  MultipleTableViewHomework
//
//  Created by Brent Fordham on 6/19/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation
import UIKit

class ThirdTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var toDoList = [Task("Buy milk", by: Date()), Task("Pick up drycleaning", by: Date()), Task("Meet Wendy for lunch", by: Date()), Task("Walk the dog", by: Date()), Task("Dance like nobody's watching, because no one is", by: Date())]
    var doneList = [Task]()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    @IBOutlet var toDoView: UITableView!
    @IBOutlet var doneView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case toDoView:
            return toDoList.count
        case doneView:
            return doneList.count
        default:
            fatalError("Request from unexpected TableView")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case toDoView:
            let cell = toDoView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
            let task = toDoList[indexPath.row]
            
            cell.textLabel?.text = task.name
            cell.detailTextLabel?.text = dateFormatter.string(from: task.dueDate)
            
            return cell
        case doneView:
            let cell = doneView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
            let task = doneList[indexPath.row]
            
            cell.textLabel?.text = task.name
            cell.detailTextLabel?.text = "Task Complete"
            
            return cell
        default:
            fatalError("Request from unexpected TableView")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case toDoView:
            let movingTask = toDoList[indexPath.row]
            doneList.append(movingTask)
            if let index = doneList.index(of: movingTask) {
                let newIndexPath = IndexPath(row: index, section: 0)
                doneView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            toDoList.remove(at: indexPath.row)
            toDoView.deleteRows(at: [indexPath], with: .automatic)
        case doneView:
            let movingTask = doneList[indexPath.row]
            toDoList.append(movingTask)
            if let index = toDoList.index(of: movingTask) {
                let newIndexPath = IndexPath(row: index, section: 0)
                toDoView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            doneList.remove(at: indexPath.row)
            doneView.deleteRows(at: [indexPath], with: .automatic)
        default:
            fatalError("Request from unexpected TableView")
        }
    }
    
}
