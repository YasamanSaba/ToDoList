//
//  Task+CoreDataProperties.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var desc: String?
    @NSManaged public var duration: Int16
    @NSManaged public var id: Int32
    @NSManaged public var passedTime: Int16
    @NSManaged public var state: Int16
    public var stateEnum: TaskState {
        get {
            return TaskState(rawValue: Int(state))!
        }
        set {
            state = Int16(newValue.rawValue)
        }
    }
    @NSManaged public var title: String?
    @NSManaged public var lastStart: Date?
    @NSManaged public var day: Day?

}
