//
//  Task.swift
//  MultipleTableViewHomework
//
//  Created by Brent Fordham on 6/19/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

class Task: Equatable {
    var name: String
    var dueDate: Date
    
    init(_ name: String, by dueDate: Date) {
        self.name = name
        self.dueDate = dueDate
    }
    
    public static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.name == rhs.name && lhs.dueDate == rhs.dueDate
    }
}
