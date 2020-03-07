//
//  Day+CoreDataProperties.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/7/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var date: Date?
    @NSManaged public var goalTime: Int16
    @NSManaged public var tasks: NSSet?
    
    public var progress: Int {
        guard let tasks = self.tasks, tasks.count > 0 else {
            return 0
        }
        
        let completedTasksCount = tasks.filter{
            let task = $0 as! Task
            return task.stateEnum == .finished
        }.count
        
        return (completedTasksCount * 100) / tasks.count
    }

}

// MARK: Generated accessors for tasks
extension Day {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}
