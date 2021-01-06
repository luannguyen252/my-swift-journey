//
//  WorkoutListInterfaceController.swift
//  FitnessExample WatchKit Extension
//
//  Created by Gualtiero Frigerio on 05/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import WatchKit
import Foundation


class WorkoutListInterfaceController: WKInterfaceController {
    
    var connectionHandler:WatchConnectionHandler?
    var workoutManager:WorkoutManager?
    var workouts = [Workout]()
    let healthKitManager = HealthKitManager.sharedInstance
    
    @IBOutlet weak var workoutTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let extensionDelegate = WKExtension.shared().delegate as? ExtensionDelegate {
            workoutManager = extensionDelegate.workoutManager
            connectionHandler = extensionDelegate.connectionHandler
            connectionHandler?.getUpdatedData(callback: { (data) in
                self.getWorkoutsFromData(data)
            })
            getInitialData()
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return rowIndex
    }
}

// MARK: Private

extension WorkoutListInterfaceController {
    
    private func getInitialData() {
        guard let connectionHandler = connectionHandler else {return}
        let data = connectionHandler.getLastData()
        getWorkoutsFromData(data)
    }
    
    private func getWorkoutsFromData(_ data:[String:Any]) {
        if let sharedWorkouts = WorkoutManager.getSharedWorkout(fromData: data) {
            if sharedWorkouts.isSingle == false {
                self.workouts = sharedWorkouts.workouts
                workoutManager?.updateAllWorkouts(self.workouts)
                self.refreshTable()
            }
        }
    }
    
    private func refreshTable() {
        workoutTable.setNumberOfRows(workouts.count, withRowType: "WorkoutListRow")
        for index in 0..<workouts.count {
            if let row = workoutTable.rowController(at: index) as? WorkoutListRow {
                row.workoutListLabel.setText(workouts[index].title)
            }
        }
    }
}
