//
//  TaskStatus.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import Foundation

public enum TaskState: Int {
    case initiated = 0
    case inProgress = 1
    case paused = 2
    case finished = 3
}
