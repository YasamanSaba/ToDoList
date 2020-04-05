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
    private var goalView: UIView!
    private var goalViewCreate: UIView!
    private var createDayBtn: UIButton!
    private var timerImage: UIImageView!
    private var progressLbl: UILabel!
    private var percentageLbl: UILabel!
    private var binBtn: UIImageView!
    private var addTaskBtn: UIButton!
    
    private var day: Day!
    private var dayService: DayServiceType!
    
    // MARK: - Functions
    
    /// It puts UI elements in the `CollectionViewCell`
    func configure() {
        
        //self.day = day
        //self.dayService = dayService
        
        self.dateLbl = UILabel()
        self.dateLbl.text = "12 March"
        self.dateLbl.font = UIFont.preferredFont(forTextStyle: .title1)
        self.dateLbl.textColor = .systemPink
        self.dateLbl.minimumScaleFactor = 0.4
        self.dateLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalView = UIView()
        self.goalView.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalViewCreate = UIView(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width * 2 / 3, height: self.contentView.bounds.height / 5))
        
        self.createDayBtn = UIButton()
        self.createDayBtn.setTitle("+ Create your day", for: .normal)
        self.createDayBtn.setTitleColor(.link, for: .normal)
        self.createDayBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.createDayBtn.addTarget(self, action: #selector(createDay), for: .touchUpInside)
        self.createDayBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.timerImage = UIImageView()
        self.timerImage.image = UIImage(systemName: "timer")
        self.timerImage.tintColor = .systemGray
        self.timerImage.contentMode = .scaleToFill
        self.timerImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.progressLbl = UILabel()
        self.progressLbl.text = "Your Progress is: "
        self.progressLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.progressLbl.textColor = .label
        self.progressLbl.minimumScaleFactor = 0.4
        self.progressLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.percentageLbl = UILabel()
        self.percentageLbl.text = "35%"
        self.percentageLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.percentageLbl.textColor = .systemGreen
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
        
        let progressStack = UIStackView(arrangedSubviews: [self.timerImage, self.progressLbl, self.percentageLbl])
        progressStack.axis = .horizontal
        progressStack.distribution = .fillProportionally
        progressStack.spacing = 2.0
        progressStack.alignment = .leading
        progressStack.translatesAutoresizingMaskIntoConstraints = false
        
        let mainStack = UIStackView(arrangedSubviews: [self.dateLbl, progressStack])
        mainStack.axis = .vertical
        mainStack.distribution = .fill
        mainStack.spacing = 7.0
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalViewCreate.addSubview(self.createDayBtn)
        self.goalView.addSubview(self.goalViewCreate)
        self.contentView.addSubview(self.goalView)
        self.contentView.addSubview(self.binBtn)
        self.contentView.addSubview(mainStack)
        NSLayoutConstraint.activate([
            self.createDayBtn.centerXAnchor.constraint(equalTo: self.goalView.centerXAnchor),
            self.createDayBtn.centerYAnchor.constraint(equalTo: self.goalView.centerYAnchor),
            self.goalView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 3 / 4),
            self.goalView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1 / 3),
            self.goalView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.goalView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.binBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.binBtn.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            mainStack.bottomAnchor.constraint(equalTo: self.binBtn.topAnchor, constant: -5),
            mainStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            mainStack.topAnchor.constraint(equalTo: self.goalView.bottomAnchor, constant: 15)
        ])
    }
    
    @objc func createDay() {

    }
    
    @objc func deleteDay() {
        
    }
    
    @objc func addTask() {
        
    }
}
