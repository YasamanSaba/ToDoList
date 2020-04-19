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
    private var goalViewShow: UIView!
    private var goalTimeLbl: UILabel!
    private var goalEdit: UIImageView!
    private var hoursGoalLbl: UILabel!
    private var goalViewDatePicker: UIView!
    private var datePicker: UIDatePicker!
    private var datePickerTxt: UITextField!
    private var toolbarDatePicker : UIToolbar!
    private var timerImage: UIImageView!
    private var progressLbl: UILabel!
    private var percentageLbl: UILabel!
    private var binBtn: UIImageView!
    private var addTaskBtn: UIButton!
    
    private var day: Day!
    private var dayService: DayServiceType!
    
    private var mainStack: UIStackView!
    
    // MARK: - Functions
    
    fileprivate func applyConstraints() {
        NSLayoutConstraint.activate([
            
            self.goalEdit.trailingAnchor.constraint(equalTo: self.goalViewShow.trailingAnchor, constant: -2),
            self.goalEdit.topAnchor.constraint(equalTo: self.goalViewShow.topAnchor),
            
            self.goalTimeLbl.leadingAnchor.constraint(equalTo: self.goalViewShow.leadingAnchor, constant: 5),
            self.goalTimeLbl.topAnchor.constraint(equalTo: self.goalViewShow.topAnchor, constant: 3),
            
            self.hoursGoalLbl.leadingAnchor.constraint(equalTo: self.goalViewShow.leadingAnchor, constant: 10),
            self.hoursGoalLbl.topAnchor.constraint(equalTo: self.goalTimeLbl.bottomAnchor, constant: 2),
            
            self.goalView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 3 / 4),
            self.goalView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1 / 3),
            self.goalView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.goalView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            
            self.goalViewCreate.widthAnchor.constraint(equalTo: self.goalView.widthAnchor),
            self.goalViewCreate.heightAnchor.constraint(equalTo: self.goalView.heightAnchor),
            self.goalViewCreate.centerXAnchor.constraint(equalTo: self.goalView.centerXAnchor),
            self.goalViewCreate.centerYAnchor.constraint(equalTo: self.goalView.centerYAnchor),
            
            self.createDayBtn.centerXAnchor.constraint(equalTo: self.goalViewCreate.centerXAnchor),
            self.createDayBtn.centerYAnchor.constraint(equalTo: self.goalViewCreate.centerYAnchor),
            
            self.goalViewShow.widthAnchor.constraint(equalTo: self.goalView.widthAnchor),
            self.goalViewShow.heightAnchor.constraint(equalTo: self.goalView.heightAnchor),
            self.goalViewShow.centerXAnchor.constraint(equalTo: self.goalView.centerXAnchor),
            self.goalViewShow.centerYAnchor.constraint(equalTo: self.goalView.centerYAnchor),
            
            self.goalViewDatePicker.widthAnchor.constraint(equalTo: self.goalView.widthAnchor),
            self.goalViewDatePicker.heightAnchor.constraint(equalTo: self.goalView.heightAnchor),
            self.goalViewDatePicker.centerXAnchor.constraint(equalTo: self.goalView.centerXAnchor),
            self.goalViewDatePicker.centerYAnchor.constraint(equalTo: self.goalView.centerYAnchor),
            
            self.datePickerTxt.leadingAnchor.constraint(equalTo: self.goalViewDatePicker.leadingAnchor),
            self.datePickerTxt.trailingAnchor.constraint(equalTo: self.goalViewDatePicker.trailingAnchor),
            self.datePickerTxt.centerXAnchor.constraint(equalTo: self.goalViewDatePicker.centerXAnchor),
            self.datePickerTxt.centerYAnchor.constraint(equalTo: self.goalViewDatePicker.centerYAnchor),
            
            self.binBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.binBtn.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.mainStack.bottomAnchor.constraint(equalTo: self.binBtn.topAnchor, constant: -5),
            self.mainStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.mainStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.mainStack.topAnchor.constraint(equalTo: self.goalView.bottomAnchor, constant: 15)
        ])
    }
    
    fileprivate func addSubviews() {
        self.goalView.addSubview(self.goalViewCreate)
        self.goalView.addSubview(self.goalViewShow)
        self.goalView.addSubview(self.goalViewDatePicker)
        self.goalViewCreate.addSubview(self.createDayBtn)
        self.goalViewShow.addSubview(self.goalEdit)
        self.goalViewShow.addSubview(self.goalTimeLbl)
        self.goalViewShow.addSubview(self.hoursGoalLbl)
        self.goalViewDatePicker.addSubview(self.datePickerTxt)
        self.contentView.addSubview(self.goalView)
        self.contentView.addSubview(self.binBtn)
        self.contentView.addSubview(self.mainStack)
    }
    
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
        //self.goalView.backgroundColor = .systemBlue
        self.goalView.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalViewCreate = UIView()
        self.goalViewCreate.translatesAutoresizingMaskIntoConstraints = false
        self.goalViewCreate.isHidden = true
        
        self.goalViewShow = UIView()
        //self.goalViewShow.backgroundColor = .systemRed
        self.goalViewShow.layer.borderWidth = 1.0
        self.goalViewShow.layer.borderColor = UIColor.systemGray5.cgColor
        self.goalViewShow.translatesAutoresizingMaskIntoConstraints = false
        self.goalViewShow.isHidden = true
        
        self.goalViewDatePicker = UIView()
        self.goalViewDatePicker.translatesAutoresizingMaskIntoConstraints = false
        //self.goalViewDatePicker.isHidden = true
        
        self.datePicker = UIDatePicker()
        self.datePicker.datePickerMode = .countDownTimer
        self.datePicker.addTarget(self, action: #selector(handler), for: UIControl.Event.valueChanged)
        
        self.datePickerTxt = UITextField()
        self.datePickerTxt.placeholder = "Add your goal time "
        self.datePickerTxt.borderStyle = .roundedRect
        self.datePickerTxt.inputView = self.datePicker
        self.datePickerTxt.tintColor = .clear
        self.datePickerTxt.translatesAutoresizingMaskIntoConstraints = false
        
        // ToolBar
        self.toolbarDatePicker = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 44))
        self.toolbarDatePicker.barStyle = UIBarStyle.default
        self.toolbarDatePicker.isTranslucent = true
        self.toolbarDatePicker.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        self.toolbarDatePicker.sizeToFit()
        
        
        // Adding Button ToolBar
         let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
         let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
         toolbarDatePicker.setItems([cancelButton, spaceButton, doneButton], animated: false)
         toolbarDatePicker.isUserInteractionEnabled = true
         datePickerTxt.inputAccessoryView = toolbarDatePicker
        
        
        self.createDayBtn = UIButton()
        self.createDayBtn.setTitle("+ Create your day", for: .normal)
        self.createDayBtn.setTitleColor(.link, for: .normal)
        self.createDayBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.createDayBtn.addTarget(self, action: #selector(createDay), for: .touchUpInside)
        self.createDayBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalTimeLbl = UILabel()
        self.goalTimeLbl.text = "Goal is:"
        self.goalTimeLbl.font = UIFont.preferredFont(forTextStyle: .title3)
        self.goalTimeLbl.textColor = .label
        self.goalTimeLbl.minimumScaleFactor = 0.4
        self.goalTimeLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.goalEdit = UIImageView()
        self.goalEdit.image = UIImage(systemName: "pencil")
        self.goalEdit.contentMode = .scaleToFill
        self.goalEdit.translatesAutoresizingMaskIntoConstraints = false
        
        self.hoursGoalLbl = UILabel()
        self.hoursGoalLbl.text = "2 hour 45 min"
        self.hoursGoalLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.hoursGoalLbl.minimumScaleFactor = 0.4
        self.hoursGoalLbl.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        self.mainStack = UIStackView(arrangedSubviews: [self.dateLbl, progressStack])
        mainStack.axis = .vertical
        mainStack.distribution = .fill
        mainStack.spacing = 7.0
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        
        applyConstraints()
    }
    
    @objc func createDay() {
        UIView.transition(from: self.goalViewCreate,
                          to: self.goalViewDatePicker,
                          duration: 0.5,
                          options: [.transitionFlipFromBottom, .showHideTransitionViews]) { _ in
                         self.datePickerTxt.becomeFirstResponder()
        }
    }
    
    @objc func deleteDay() {
        
    }
    
    @objc func addTask() {
        
    }
    
    @objc func doneClick() {
        
    }
    
    @objc func cancelClick() {
        self.datePickerTxt.resignFirstResponder()
        UIView.transition(from: self.goalViewDatePicker,
                          to: self.goalViewCreate,
                          duration: 0.5,
                          options: [.transitionFlipFromBottom, .showHideTransitionViews],
                          completion: nil)
    }
    
    @objc func handler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let strDate = timeFormatter.string(from: datePicker.date)
        self.datePickerTxt.text = strDate
        self.datePickerTxt.textAlignment = .center
        self.datePickerTxt.font = UIFont.preferredFont(forTextStyle: .title1)
        self.datePickerTxt.borderStyle = .roundedRect
    }
}
