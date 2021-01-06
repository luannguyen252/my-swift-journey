//
//  HealthKitManager.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 07/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import HealthKit

typealias HeartRateObserverCallback = ((Double) -> Void)

class HealthKitManager : NSObject {
    
    static let sharedInstance = HealthKitManager()
    let healthStore = HKHealthStore()
    var anchor:HKQueryAnchor?
    var heartRateObserversCallbacks:[HeartRateObserverCallback]?
    var authorizationGranted = false
    private var heartRateQuery:HKAnchoredObjectQuery?
    private var heartRateObserverQuery:HKObserverQuery?
    private let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)
    
    func requestAuthorization(completion: @escaping (_ success:Bool) -> Void) {
        
        guard let heartRateType = heartRateType else {
            print("cannot get heart rate type")
            return
        }
        let readTypes = Set([HKObjectType.workoutType(), heartRateType])
        let shareTypes = Set([HKObjectType.workoutType(), heartRateType])
        
        healthStore.requestAuthorization(toShare: shareTypes, read: readTypes) { (success, error) in
            if success == false {
                print("cannot get health store authorization error = \(String(describing: error))")
            }
            self.authorizationGranted = success
            completion(success)
        }
    }
    
    func addHeartRateObserver(callback:@escaping HeartRateObserverCallback) {
        if heartRateObserversCallbacks == nil {
            heartRateObserversCallbacks = [HeartRateObserverCallback]()
            startMonitoringHeartRate()
        }
        heartRateObserversCallbacks?.append(callback)
    }
    
    func saveWorkoutToHealthKit(_ workout:Workout) {
        guard let hkWorkout = createHKWorkoutFromWorkout(workout) else {return}
        healthStore.save(hkWorkout) { (success, error) in
            guard success else {
                print("error while saving workout to healthkit \(String(describing: error?.localizedDescription))")
                return
            }
            if let samples = self.getSamplesFromWorkout(workout) {
                self.healthStore.add(samples, to: hkWorkout, completion: { (success, error) in
                    guard success else {
                        print("error adding samples to workout \(String(describing: error?.localizedDescription))")
                        return
                    }
                })
            }
        }
    }
}

// MARK: Private functions

extension HealthKitManager {
    
    private func startMonitoringHeartRate() {
        if let query = getHeartRateAnchoredQuery(fromDate: Date()) {
            self.heartRateQuery = query
            healthStore.execute(query)
        }
        
//        use the observer query
//        if let query = getHeartRateObserverQuery() {
//            healthStore.execute(query)
//        }
    }
    
    private func getHeartRateAnchoredQuery(fromDate: Date) -> HKAnchoredObjectQuery? {
        guard let heartRateType = heartRateType else {
            print("cannot get heart rate type")
            return nil
        }
        let heartRateQuery = HKAnchoredObjectQuery(type: heartRateType, predicate: nil, anchor: nil, limit: Int(HKObjectQueryNoLimit)) { (query, sampleObjects, deleteObjects, anchor, error) in
            guard let anchor = anchor,
                let sampleObjects = sampleObjects else {
                    print("no anchor or sampleObjects returned")
                    return
            }
            self.anchor = anchor
            self.notifyHeartRateObservers(forSamples: sampleObjects)
        }
        heartRateQuery.updateHandler = {(query, sampleObjects, deleteObjects, anchor, error) in
            guard let anchor = anchor,
                let sampleObjects = sampleObjects else {
                    print("no anchor or sampleObjects returned")
                    return
            }
            print("update handler called")
            self.anchor = anchor
            self.notifyHeartRateObservers(forSamples: sampleObjects)
        }
        return heartRateQuery
    }
    
    private func getHeartRateObserverQuery() -> HKObserverQuery? {
        guard let heartRateType = heartRateType else {
            print("cannot get heart rate type")
            return nil
        }
        return HKObserverQuery.init(sampleType: heartRateType, predicate: nil, updateHandler: { queries, _, error in
            self.fetchLatestHeartRate(completion: { samples in
                guard let samples = samples else {return}
                self.notifyHeartRateObservers(forSamples: samples)
            })
        })
    }
    
    private func fetchLatestHeartRate(completion: @escaping (_ sample:[HKQuantitySample]?) -> Void) {
        print("fetchLatest")
        guard let heartRateType = heartRateType else {
            completion(nil)
            return
            
        }
        let sortDescriptor = NSSortDescriptor(
            key: HKSampleSortIdentifierStartDate,
            ascending: false)
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) { (_, results, error) in
                guard error == nil else {
                    print("Error: \(error!.localizedDescription)")
                    return
                }
            print("results returned")
            guard let results = results else {return}
            if results.count > 0 {
                completion(results as? [HKQuantitySample])
            }
        }
        self.healthStore.execute(query)
    }
    
    private func notifyHeartRateObservers(forSamples heartRateSamples: [HKSample]) {
        guard let samples = heartRateSamples as? [HKQuantitySample],
              let sample = samples.first,
              let heartRateObserversCallbacks = heartRateObserversCallbacks else {return}
        
        let value = getDoubleValueForSample(sample)
        for callback in heartRateObserversCallbacks {
            callback(value)
        }
    }
    
    private func getDoubleValueForSample(_ sample:HKQuantitySample) -> Double {
        return sample.quantity.doubleValue(for:HKUnit.init(from: "count/s"))*60
    }
}

// MARK: - HealthKit workout

extension HealthKitManager {
    private func createHKWorkoutFromWorkout(_ workout:Workout) -> HKWorkout? {
        guard let startDate = workout.startDate,
              let endDate = workout.endDate,
              let duration = workout.getDuration() else {return nil}
        let calories = HKQuantity(unit: HKUnit.kilocalorie(),
                                  doubleValue: workout.getBurnedCalories())
        let hkWorkout = HKWorkout(activityType: .other, start: startDate, end: endDate, duration: duration, totalEnergyBurned: calories, totalDistance: nil, metadata: nil)
        return hkWorkout
    }
    
    private func getSamplesFromWorkout(_ workout:Workout) -> [HKSample]? {
        guard let startDate = workout.startDate,
            let endDate = workout.endDate,
            let averageHeartRate = workout.averageHeartRate,
            let heartRateType = heartRateType else {return nil}
        let heartRateForInterval = HKQuantity(unit: HKUnit(from: "count/min"),
                                              doubleValue: averageHeartRate)
        let heartRateForIntervalSample =
            HKQuantitySample(type: heartRateType, quantity: heartRateForInterval,
                             start: startDate, end: endDate)
        return [heartRateForIntervalSample]
    }
}
