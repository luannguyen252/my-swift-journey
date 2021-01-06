//
//  WorkoutViewController.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 06/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var heartRateLabel: UILabel!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var workoutImageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    
    var workoutManager:WorkoutManager?
    var connectionHandler:PhoneConnectionHandler?
    var workoutIndex:Int = 0
    var workout:Workout?
    var startEditing = false
    
    private lazy var imageManager = ImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let workoutManager = workoutManager,
              let workout = workoutManager.getWorkout(atIndex: workoutIndex) else {return}
        self.workout = workout
        loadWorkout()
        changeButtonsText()
        if startEditing == true {
            editWorkout()
        }
    }
    
    @IBAction func editButtonTap(_ sender: Any) {
        if startEditing == true {
            saveWorkout()
        }
        else {
            editWorkout()
        }
        startEditing = !startEditing
        changeButtonsText()
    }
    
    @IBAction func addImageButtonTap(_ sender: Any) {
        imageManager.getImage(fromSource: .photoLibrary, presentingViewController: self) { (image) in
            guard let image = image,
                  let workoutManager = self.workoutManager else {return}
            let imageName = String(Date().timeIntervalSince1970)  + ".jpg"
            let imagePath = workoutManager.pathForImage(withName: imageName)
            ImageManager.saveImage(image, toPath: imagePath, withFormat: ImageFormat.JPEG)
            self.connectionHandler?.sendImageToWatch(image, withName: imageName)
            self.updateWorkoutWithImage(imageName)
            self.loadWorkout()
        }
    }
}

// MARK: Private

extension WorkoutViewController {
    private func changeButtonsText() {
        editButton.title = startEditing == false ? "Edit" : "Save"
        if let workout = workout, let _ = workout.imageName {
            addImageButton.setTitle("change", for: .normal)
        }
    }
    
    private func loadWorkout() {
        guard let workout = workout,
              let workoutManager = workoutManager else {return}
        titleTextField.text = workout.title
        descriptionTextView.text = workout.description
        startDateLabel.text = workout.getStartDateString()
        endDateLabel.text = workout.getEndDateString()
        heartRateLabel.text = workout.getHeartRateStringValue()
        if let name = workout.imageName {
            let imageFullPath = workoutManager.pathForImage(withName: name)
            let image = UIImage(contentsOfFile: imageFullPath)
            workoutImageView.image = image
        }
    }
    
    private func editWorkout() {
        titleTextField.isUserInteractionEnabled = true
        descriptionTextView.isUserInteractionEnabled = true
    }
    
    private func saveWorkout() {
        titleTextField.isUserInteractionEnabled = false
        descriptionTextView.isUserInteractionEnabled = false
        
        guard var workout = workout else {return}
        if let title = titleTextField.text {
            workout.title = title
        }
        if let desc = descriptionTextView.text {
            workout.description = desc
        }
        
        workoutManager?.updateWorkout(atIndex: workoutIndex, workout: workout)
    }
    
    private func updateWorkoutWithImage(_ imageName:String) {
        guard var workout = workout,
              let workoutManager = workoutManager else {return}
        workout.imageName = imageName
        workoutManager.updateWorkout(atIndex: workoutIndex, workout: workout)
        self.workout = workout
    }
}
