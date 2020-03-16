//
//  CollectionViewCell.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/12/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
  // MARK: - Properties
    private var dateLbl: UILabel!
    private var createDayBtn: UIButton!
    private var clockImage: UIImageView!
    private var goalTextLbl: UILabel!
    private var goalTimeLbl: UILabel!
    private var progressLbl: UILabel!
    private var percentageLbl: UILabel!
    private var binBtn: UIImageView!
    private var addTaskBtn: UIButton!
    
    // MARK: - Functions
    
    /// It puts UI elements in the `CollectionViewCell`
    func configure() {
        self.dateLbl = UILabel()
        self.dateLbl.text = "12 March"
        self.dateLbl.font = UIFont.preferredFont(forTextStyle: .title1)
        self.dateLbl.textColor = .label
        self.dateLbl.minimumScaleFactor = 0.4
        self.dateLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.createDayBtn = UIButton()
        self.createDayBtn.setTitle("Create your day", for: .normal)
        self.createDayBtn.setTitleColor(.link, for: .normal)
        self.createDayBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        self.createDayBtn.addTarget(self, action: #selector(createDay), for: .touchUpInside)
        self.createDayBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.clockImage = UIImageView()
        self.clockImage.image = UIImage(systemName: "stopwatch")
        self.clockImage.contentMode = .scaleToFill
        self.clockImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalTextLbl = UILabel()
        self.goalTextLbl.text = "Your goal is: "
        self.goalTextLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.goalTextLbl.textColor = .label
        self.goalTextLbl.minimumScaleFactor = 0.4
        self.goalTextLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalTimeLbl = UILabel()
        self.goalTimeLbl.text = "7:30"
        self.goalTimeLbl.font = UIFont.preferredFont(forTextStyle: .title2)
        self.goalTimeLbl.textColor = .systemGray
        self.goalTimeLbl.minimumScaleFactor = 0.4
        self.goalTimeLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.progressLbl = UILabel()
        self.progressLbl.text = "Your Progress: "
        self.progressLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.progressLbl.textColor = .label
        self.progressLbl.minimumScaleFactor = 0.4
        self.progressLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.percentageLbl = UILabel()
        self.percentageLbl.text = "35%"
        self.percentageLbl.font = UIFont.preferredFont(forTextStyle: .title1)
        self.percentageLbl.textColor = .systemRed
        self.percentageLbl.minimumScaleFactor = 0.4
        self.percentageLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.binBtn = UIImageView()
        self.binBtn.image = UIImage(systemName: "trash.fill")
        self.binBtn.contentMode = .scaleToFill
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(deleteDay))
        self.binBtn.isUserInteractionEnabled = true
        self.binBtn.addGestureRecognizer(tapGestureRecognizer)
        self.binBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addTaskBtn = UIButton()
        self.addTaskBtn.setTitle("Add Task", for: .normal)
        self.addTaskBtn.setTitleColor(.link, for: .normal)
        self.addTaskBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        self.addTaskBtn.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        self.addTaskBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    @objc func createDay() {
        
    }
    
    @objc func deleteDay() {
        
    }
    
    @objc func addTask() {
        
    }
}
