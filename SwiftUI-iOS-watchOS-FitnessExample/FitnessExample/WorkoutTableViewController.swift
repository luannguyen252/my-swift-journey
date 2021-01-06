//
//  WorkoutTableViewController.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 06/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {

    var workoutManager = WorkoutManager()
    var connectionHandler = PhoneConnectionHandler()
    var healthKitManager = HealthKitManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        sendDataToWatch()
        
        healthKitManager.requestAuthorization { (success) in
            if success == false {
                print("error while getting authorization")
            }
        }
        
        connectionHandler.getUpdatedData { data in
            self.workoutManager.updateWithSharedData(data)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func actionsButtonTap(_ sender: Any) {
        let actionSheet = UIAlertController(title: "", message: "Chose action", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel , handler:{ (UIAlertAction)in
            print("cancel action")
        }))
        actionSheet.addAction(UIAlertAction(title: "Add workout", style: .default , handler:{ (UIAlertAction)in
            self.performSegue(withIdentifier: "workoutSegue", sender: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Save", style: .default , handler:{ (UIAlertAction)in
            self.workoutManager.saveWorkouts()
        }))
        actionSheet.addAction(UIAlertAction(title: "Send to Watch", style: .default , handler:{ (UIAlertAction)in
            self.sendDataToWatch()
        }))
        actionSheet.addAction(UIAlertAction(title: "Save to HK", style: .default , handler:{ (UIAlertAction)in
            self.saveWorkoutsToHealthKit()
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WorkoutViewController {
            destination.workoutManager = workoutManager
            if sender is UITableViewCell {
                destination.workoutIndex = self.tableView.indexPathForSelectedRow?.row ?? 0
                destination.connectionHandler = self.connectionHandler
            }
            else {
                let newIndex = self.workoutManager.addNewWorkout()
                destination.workoutIndex = newIndex
                destination.startEditing = true
            }
        }
    }
}

// MARK: - Table view data source

extension WorkoutTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutManager.workoutsCount
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        if let workout = workoutManager.getWorkout(atIndex: indexPath.row) {
            cell.textLabel?.text = workout.title
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            workoutManager.removeWorkout(atIndex: indexPath.row)
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
     }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        workoutManager.moveWorkout(fromIndex: fromIndexPath.row, toIndex: to.row)
    }
}

// MARK: - Private functions

extension WorkoutTableViewController {
    private func saveWorkoutsToHealthKit() {
        for workout in workoutManager.getAllWorkouts() {
            healthKitManager.saveWorkoutToHealthKit(workout)
        }
    }
    
    private func sendDataToWatch() {
        let data = self.workoutManager.getDataForAllWorkouts()
        self.connectionHandler.sendDataToCounterpart(data)
    }
}
