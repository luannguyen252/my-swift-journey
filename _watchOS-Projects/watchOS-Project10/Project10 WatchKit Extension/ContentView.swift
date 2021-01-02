//
//  ContentView.swift
//  Project10 WatchKit Extension
//
//  Created by Paul Hudson on 07/10/2020.
//

import HealthKit
import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let activities: [(name: String, type: HKWorkoutActivityType)] = [
        ("Cycling", .cycling),
        ("Running", .running),
        ("Wheelchair", .wheelchairRunPace)
    ]

    @StateObject var dataManager = DataManager()
    @State private var selectedActivity = 0

    // MARK: - BODY
    var body: some View {
        if dataManager.state == .inactive {
            VStack {
                // MARK: - PICKER
                Picker("Choose an activity", selection: $selectedActivity) {
                    ForEach(0 ..< activities.count) { index in
                        Text(activities[index].name)
                            .font(.headline)
                    }
                }

                // MARK: - CALL TO ACTION
                Button("Start Workout") {
                    guard HKHealthStore.isHealthDataAvailable() else { return }
                    dataManager.activity = activities[selectedActivity].type
                    dataManager.start()
                }
                .padding(.top, 8)
            } //: VSTACK
        } else {
            WorkoutView(dataManager: dataManager)
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
