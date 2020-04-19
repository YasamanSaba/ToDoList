//
//  DayServiceType.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import Foundation
import CoreData

enum DayServiceError: Error {
    case addFailed
    case dayAlreadyExists
    case fetchDaysFailed
}

protocol DayServiceType {
    func add(date: Date, goalTime: Int) throws
    func update(day: Day, goalTime: Int)
    func delete(day: Day)
    func days() -> NSFetchedResultsController<Day>
}
