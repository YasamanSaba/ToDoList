//
//  TaskServiceType.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/3/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import Foundation

enum TaskServiceError: Error {
    case creationFailed
    case editFailed
    case deletationFailed
    case startFailed
    case pauseFailed
    case finishFailed
    case resetFailed
}

protocol TaskServiceType {
    func create(task: Task, day: Day) throws
    func edit(task: Task, title: String?, desc: String?, duration: Int?)
    func delete(task: Task)
    func start(task: Task)
    func pause(task: Task) throws
    func finish(task: Task)
    func reset(task: Task)
}
