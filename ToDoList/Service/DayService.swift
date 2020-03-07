//
//  DayService.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/7/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import UIKit
import CoreData

struct DayService: DayServiceType {
        
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func add(day: Day) throws{
        guard let currentDate = day.date else {
            throw DayServiceError.addFailed
        }
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let newDate = calendar.startOfDay(for: currentDate)
        let dayRequest = NSFetchRequest<NSNumber>(entityName: "Day")
        dayRequest.resultType = .countResultType
        let dayPredicate = NSPredicate(format: "%K == %@", #keyPath(Day.date), newDate as NSDate)
        dayRequest.predicate = dayPredicate
        var count = 0
        do {
            count = try self.context.fetch(dayRequest).first == nil ? 0 : self.context.fetch(dayRequest).first!.intValue
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            throw DayServiceError.addFailed
        }
        guard count != 0 else {
            throw DayServiceError.dayAlreadyExist
        }
        let newDay = Day(context: self.context)
        newDay.date = newDate
        newDay.goalTime = day.goalTime
        self.appDelegate.saveContext()
    }
    
    func update(day: Day, goalTime: Int) {
        day.goalTime = Int16(goalTime)
        self.appDelegate.saveContext()
    }
    
    func delete(day: Day) {
        self.context.delete(day)
        self.appDelegate.saveContext()
    }
    
    func days() -> NSFetchedResultsController<Day> {
        let fetcheRequest: NSFetchRequest<Day> = Day.fetchRequest()
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetcheRequest, managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
}
