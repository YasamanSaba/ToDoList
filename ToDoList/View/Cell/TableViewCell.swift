//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Yasaman Farahani Saba on 3/8/20.
//  Copyright © 2020 Dream Catcher. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private var taskService: TaskServiceType!
    
    private var titleLbl: UILabel!
    private var descLbl: UITextView!
    private var durationLbl: UILabel!
    private var stateImage: UIImageView!
    private var progressBar: UIProgressView!
    private var resetBtn: UIButton!
    private var task: Task!
    private var openDesc = false
    private var mainStack: UIStackView!
    private var accessView: UIImageView!
    private var timer: Timer!
    
    func configure(task: Task, taskService: TaskServiceType) {
        self.task = task
        self.taskService = taskService
        
        self.titleLbl = UILabel()
        self.titleLbl.text = task.title
        self.titleLbl.font = UIFont.preferredFont(forTextStyle: .title2)
        self.titleLbl.textColor = .label
        self.titleLbl.minimumScaleFactor = 0.4
        self.titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.descLbl = UITextView()
        self.descLbl.text = task.desc
        self.descLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.descLbl.textColor = .secondaryLabel
        self.descLbl.isHidden = true
        self.descLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.durationLbl = UILabel()
        let hours = String(Int(task.duration / 60))
        let minutes = String(Int(task.duration % 60))
        self.durationLbl.text = hours + " h " + (minutes.count == 1 ? "0" + minutes : minutes) + " m"
        self.durationLbl.font = UIFont.preferredFont(forTextStyle: .body)
        self.durationLbl.textColor = .systemRed
        self.durationLbl.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.durationLbl.setContentCompressionResistancePriority(.required, for: .vertical)
        self.durationLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.stateImage = UIImageView()
        self.stateImage.image = UIImage(systemName: "play.fill")
        self.stateImage.contentMode = .scaleToFill
        let tapGestureRecognizerState = UITapGestureRecognizer(target: self, action: #selector(playPause))
        self.stateImage.isUserInteractionEnabled = true
        self.stateImage.addGestureRecognizer(tapGestureRecognizerState)
        self.stateImage.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.stateImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.progressBar = UIProgressView()
        self.progressBar.tintColor = .systemGreen
        let progress = Float(task.passedTime) / Float(task.duration)
        self.progressBar.setProgress(progress, animated: true)
        self.progressBar.layer.cornerRadius = 5
        self.progressBar.clipsToBounds = true
        self.progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.accessView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        self.accessView.image = UIImage(systemName: "chevron.down.circle")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleDesc))
        self.accessView.isUserInteractionEnabled = true
        self.accessView.addGestureRecognizer(tapGestureRecognizer)
        self.accessoryView = self.accessView
        
        self.resetBtn = UIButton()
        self.resetBtn.setTitle("Reset", for: .normal)
        self.resetBtn.setTitleColor(.link, for: .normal)
        self.resetBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        self.resetBtn.addTarget(self, action: #selector(reset), for: .touchUpInside)
        self.resetBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        let durationStack = UIStackView(arrangedSubviews: [self.durationLbl, self.resetBtn])
        durationStack.axis = .vertical
        durationStack.distribution = .fill
        durationStack.spacing = 2.0
        durationStack.alignment = .leading
        durationStack.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomStack = UIStackView(arrangedSubviews: [self.stateImage, self.progressBar, durationStack])
        bottomStack.axis = .horizontal
        bottomStack.distribution = .fill
        bottomStack.spacing = 8.0
        bottomStack.alignment = .center
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.mainStack = UIStackView(arrangedSubviews: [self.titleLbl, bottomStack])
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.spacing = 4.0
        
        self.contentView.addSubview(mainStack)
        self.contentView.addSubview(self.descLbl)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.descLbl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.descLbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.descLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.descLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.progressBar.heightAnchor.constraint(equalTo: bottomStack.heightAnchor, multiplier: 1/3),
            mainStack.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -5),
            mainStack.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -10),
            mainStack.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    @objc func reset() {
        let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to reset your time?", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Reset", style: .default) { [unowned self] action in
            self.taskService.reset(task: self.task)
            self.progressBar.setProgress(Float(self.task.passedTime) / Float(self.task.duration), animated: true)
            self.stateImage.image = UIImage(systemName: "play.fill")
            self.timer.invalidate()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        let rootViewController = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }.map { $0 as? UIWindowScene }.compactMap{$0}.first?.windows.filter{$0.isKeyWindow}.first?.rootViewController
        rootViewController?.present(alertController, animated: true)
    }
    
    @objc func toggleDesc() {
        if self.openDesc {
            UIView.transition(from: self.descLbl, to: self.mainStack, duration: 0.5, options: [.transitionFlipFromBottom, .showHideTransitionViews], completion: { _ in
                self.accessView.image = UIImage(systemName: "chevron.down.circle")
            })
        } else {
            UIView.transition(from: self.mainStack,
                              to: self.descLbl,
                              duration: 0.5,
                              options: [.transitionFlipFromTop, .showHideTransitionViews],
                              completion: { _ in
                                self.accessView.image = UIImage(systemName: "chevron.up.circle")
            })
        }
        self.layoutIfNeeded()
        self.openDesc = !self.openDesc
    }
    
    @objc func playPause() {
        switch self.task.stateEnum {
        case .initiated, .paused:
            self.taskService.start(task: self.task)
            self.stateImage.image = UIImage(systemName: "pause.fill")
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { timer in
                let currentTime = self.task.passedTime + 1
                if currentTime == self.task.duration {
                    self.taskService.finish(task: self.task)
                    self.stateImage.isHidden = true
                    self.resetBtn.isHidden = true
                    timer.invalidate()
                } else {
                    self.taskService.setPassedTime(task: self.task, passedTime: currentTime)
                }
                self.progressBar.setProgress(Float(self.task.passedTime) / Float(self.task.duration), animated: true)
            }
            
        case .inProgress:
            do {
                try self.taskService.pause(task: self.task)
                self.stateImage.image = UIImage(systemName: "play.fill")
                self.timer.invalidate()
            } catch {
                print(error)
            }
        default:
            print("UnAuthorised state")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
