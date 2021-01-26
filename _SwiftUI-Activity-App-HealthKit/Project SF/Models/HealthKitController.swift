import Foundation
import HealthKit

class HealthKitController: ObservableObject {
    // MARK: Properties
    let healthStore: HKHealthStore
    
    // MARK: Published Properties
    @Published var processBegan = false
    @Published var success = false

    @Published var moveCurrent = 0.0
    @Published var moveGoal = 1.0

    @Published var exerciseCurrent = 0.0
    @Published var exerciseGoal = 30.0

    @Published var standCurrent = 0.0
    @Published var standGoal = 12.0
    
    // MARK: Init
    init(healthStore: HKHealthStore = .init()) {
        self.healthStore = healthStore
    }
    
    // MARK: Methods
    /// Authorize HealthKit with specified types. Will present a screen to give access if not previously enabled.
    func authorizeHealthKit() {
        DispatchQueue.main.async {
            self.processBegan = true
        }

        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
            HKObjectType.quantityType(forIdentifier: .appleStandTime)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.activitySummaryType()
        ]

        healthStore.requestAuthorization(toShare: nil, read: healthKitTypes, completion: { success, _ in
            if success {
                print("Success! HK is working")
                DispatchQueue.main.async {
                    self.success = true
                }
            }
        })
    }
    
    /// Gets activity data for current day, and stores the new values in the published vars.
    func updateAllActivityData() {
        let resultHandler: (HKActivitySummaryQuery, [HKActivitySummary]?, Error?) -> Void = { query, result, error in

            if let results = result {
                if !results.isEmpty {
                    DispatchQueue.main.async {
                        let moveUnits = HKUnit.largeCalorie()
                        self.moveCurrent = results.last!.activeEnergyBurned.doubleValue(for: moveUnits)
                        self.moveGoal = results.last!.activeEnergyBurnedGoal.doubleValue(for: moveUnits)

                        let exerciseUnits = HKUnit.minute()
                        self.exerciseCurrent = results.last!.appleExerciseTime.doubleValue(for: exerciseUnits)
                        self.exerciseGoal = results.last!.appleExerciseTimeGoal.doubleValue(for: exerciseUnits)

                        let standUnits = HKUnit.count()
                        self.standCurrent = results.last!.appleStandHours.doubleValue(for: standUnits)
                        self.standGoal = results.last!.appleStandHoursGoal.doubleValue(for: standUnits)
                    }
                    print("Move: \(self.moveCurrent)/\(self.moveGoal)")
                    print("Exercise: \(self.exerciseCurrent)/\(self.exerciseGoal)")
                    print("Stand: \(self.standCurrent)/\(self.standGoal)")
                } else {
                    print("No results!")
                }
            }

            if error != nil {
                print("Error: \(error!)")
            }
        }

        let query = HKActivitySummaryQuery(predicate: nil, resultsHandler: resultHandler)
        healthStore.execute(query)
    }
    
    func update(data: HKQuantityTypeIdentifier, for day: Date) {
        let dataType = HKQuantityType.quantityType(forIdentifier: data)

        let calendar = Calendar(identifier: .gregorian)
        let startOfDay = calendar.startOfDay(for: day)

        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: day, options: .strictStartDate)
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsCollectionQuery(
            quantityType: dataType!,
            quantitySamplePredicate: predicate,
            options: [.cumulativeSum],
            anchorDate: startOfDay as Date,
            intervalComponents: interval
        )
        
        query.initialResultsHandler = { query, result, error in
            if let results = result {
                results.enumerateStatistics(from: startOfDay, to: day) { statistics, _ in
                    if let quantity = statistics.sumQuantity() {
                        let dataResult = quantity.doubleValue(for: HKUnit.meter())

                        print("Result = \(dataResult)")
                    }
                }
            }
            
            if error != nil {
                print("Error: \(error!)")
            }
        }
    }
}
