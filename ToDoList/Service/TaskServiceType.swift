//
//  TaskServiceType.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import Foundation

protocol TaskServiceType {
    func create(task: Task)
    func edit(task: Task)
    func delete(task: Task)
}
