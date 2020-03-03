//
//  DayServiceType.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import Foundation

protocol DayServiceType {
    func add(day: Day)
    func update(day: Day, goalTime: Int)
    func delete(day: Day)
    func progress(day: Day) -> Int
}
