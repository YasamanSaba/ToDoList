//
//  TaskService.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import UIKit
import CoreData

struct TaskService: TaskServiceType {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createTask(title: String, desc: String?, duration: Int16, day: Day) throws {
        let request = NSFetchRequest<NSNumber>(entityName: "Task")
        request.resultType = .countResultType
        var count = 0
        do{
            count = try self.context.fetch(request).first!.intValue
            
        } catch let error as NSError {
            print("Fetch tasks failed \(error), \(error.userInfo)")
            throw TaskServiceError.creationFailed
        }
        
        let tempTask = Task(context: self.context)
        tempTask.id = Int32(count + 1)
        tempTask.title = title
        tempTask.desc = desc
        tempTask.stateEnum = .initiated
        tempTask.duration = duration
        tempTask.passedTime = 0
        tempTask.day = day
        self.appDelegate.saveContext()
    }

    func edit(task: Task, title: String?, desc: String?, duration: Int?) {
        if let title = title {
            task.title = title
        }
        if let desc = desc {
            task.desc = desc
        }
        if let duration = duration {
            task.duration = Int16(duration)
        }
        self.appDelegate.saveContext()
    }
    
    func delete(task: Task) {
        self.context.delete(task)
        self.appDelegate.saveContext()
    }
    
    func start(task: Task) {
        task.lastStart = Date()
        task.stateEnum = .inProgress
        self.appDelegate.saveContext()
    }
    
    func pause(task: Task) throws {
        guard let lastStart = task.lastStart else {
            throw TaskServiceError.pauseFailed
        }
        if task.stateEnum != .inProgress {
            throw TaskServiceError.pauseFailed
        }
        let currentDate = Date()
        let minutes = currentDate.timeIntervalSince(lastStart) < 60 ? 0 : currentDate.timeIntervalSince(lastStart) / 60
        task.passedTime = Int16(minutes)
        task.stateEnum = .paused
        self.appDelegate.saveContext()
    }
    
    func finish(task: Task) {
        task.stateEnum = .finished
        task.passedTime = task.duration
        self.appDelegate.saveContext()
    }
    
    func reset(task: Task) {
        task.lastStart = nil
        task.passedTime = 0
        task.stateEnum = .initiated
        self.appDelegate.saveContext()
    }
    
    func setPassedTime(task: Task, passedTime: Int16) {
        task.passedTime = passedTime
        self.appDelegate.saveContext()
    }
    
    func tasks(in day: Day) -> NSFetchedResultsController<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Task.id), ascending: true)
        request.sortDescriptors = [sort]
        let dayPredicate = NSPredicate(format: "%K == %@", #keyPath(Task.day), day)
        request.predicate = dayPredicate
        return NSFetchedResultsController(fetchRequest: request,
                                          managedObjectContext: self.context,
                                          sectionNameKeyPath: nil,
                                          cacheName: nil)
    }
}
