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
    func create(task: Task) throws
    func edit(task: Task, title: String?, desc: String?, duration: Int?) throws
    func delete(task: Task) throws
    func start(task: Task) throws
    func pause(task: Task) throws
    func finish(task: Task) throws
    func reset(task: Task) throws
}
