//
//  ViewController.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/1/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }


}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let task = Task(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        task.title = "Do Sport"
        task.duration = 3
        task.stateEnum = .initiated
        task.passedTime = 0
        task.desc = "dfgjhadjfhiahfigailgfliageiorgygeahgljkvlhgfkuygaifhglasdgfukgsLIGdfgjhadjfhiahfigailgfliageiorgygeahgljkvlhgfkuygaifhglasdgfukgsLIG"
        cell.configure(task: task, taskService: TaskService())
        return cell
    }
    
    
}
