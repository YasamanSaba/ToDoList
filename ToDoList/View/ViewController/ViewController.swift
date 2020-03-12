//
//  ViewController.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/1/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let taskService = TaskService()
    let dayService = DayService()
    var resultController: NSFetchedResultsController<Task>!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        let dayRequest: NSFetchRequest<Day> = Day.fetchRequest()
        let day = try! self.context.fetch(dayRequest).first!
        self.resultController = self.taskService.tasks(in: day)
        try! self.resultController.performFetch()
        self.tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = self.resultController.sections?.first else {
            return 0
        }
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let task = self.resultController.object(at: indexPath)
        cell.configure(task: task, taskService: self.taskService)
        return cell
    }
    
    
}
