//
//  HealthManager.swift
//  HKTutorial
//
//  Created by ernesto on 18/10/14.
//  Copyright (c) 2014 raywenderlich. All rights reserved.
//

import Foundation
import HealthKit
import CoreData
import AVFoundation

enum HealthManagerSynchronisationMode {
    case delete
    case save
    case update
}

final class HealthManager {
    
    static let healthKitStore:HKHealthStore = HKHealthStore()
    
    class func authorizeHealthKit(_ completion: ((_ success: Bool, _ error: NSError?) -> Void)!) {
        
        // 1. and 2. Set the types you want to share and read from HK Store
        let healthKitSampleTypesToShare = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryEnergyConsumed),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCarbohydrates),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryProtein),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFatTotal)
            ]
            .compactMap{$0 as HKSampleType?}
        
        let healthKitObjectTypesToRead = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryEnergyConsumed),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCarbohydrates),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryProtein),
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryFatTotal)
            ]
            .compactMap{$0 as HKObjectType?}
        
        let healthKitTypesToShare: Set? = Set<HKSampleType>(healthKitSampleTypesToShare)
        let healthKitTypesToRead: Set?  = Set<HKObjectType>(healthKitObjectTypesToRead)
        
        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
        if !HKHealthStore.isHealthDataAvailable() {
            let error = NSError(domain: "UPP.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if completion != nil {
                completion(false , error)
            }
            return
        }
        
        // 4.  Request HealthKit authorization
        healthKitStore.requestAuthorization(toShare: healthKitTypesToShare, read: healthKitTypesToRead) { (success, error) -> Void in
            if completion != nil {
                let hugo = error as NSError?
                completion(success, hugo)
            }
        }
    }
    
    
    private class func syncMealToHealth(_ meal: Meal) {
        deleteMeal(meal) // delete the (old) meal data currently stored from health store
        
        // Deletion and saving is handled asynchronosly. Meanwhile with a lot of date in health deletion takes some time and often performed after storing the new data. Thus new data ist deleted just after having been stored. Not what we want. Temporary solution: delay saving.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            saveMeal(meal) // store the new data of the meal in health store
        }
    }
    
    class func synchronize(_ meal: Meal, withSynchronisationMode synchronisationMode: HealthManagerSynchronisationMode) {
        switch synchronisationMode {
        case .save:
            saveMeal(meal)
        case .delete, .update:
            deleteOrUpdateMeal(meal, sychronisationMode: synchronisationMode)
        }
    }
    
    private class func saveMeal(_ meal: Meal) {
        guard let mealCorrelation = correlationForMeal(meal) else {
            return
        }
        // 2. Save the correlation (i.e. meal) in the store
        healthKitStore.save(mealCorrelation, withCompletion: { (success, error) -> Void in
            if( error != nil ) {
                print("Error saving carb sample: \(error!.localizedDescription)")
            } else {
                print("Saved food correlation successfully!")
            }
            print("Executed health save meal query")
        })
    }
    
    
    private class func correlationForMeal(_ meal: Meal) -> HKCorrelation? {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit is not available in this Device")
            // let error = NSError(domain: "UPP.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            return nil
        }
        print("About to save the object with id: \(meal.objectID)")
        let managedObjectContext = meal.managedObjectContext
        let mealMetaData = ["comment": meal.comment ?? "", "CoreDataObjectIDAsURIString": meal.objectID.uriRepresentation().absoluteString]
        
        // match health kit quantity identifiers with nutrients of this application
        let identifiers = [("totalEnergyCals", HKQuantityTypeIdentifier.dietaryEnergyConsumed),
                           ("totalCarb", HKQuantityTypeIdentifier.dietaryCarbohydrates),
                           ("totalProtein", HKQuantityTypeIdentifier.dietaryProtein),
                           ("totalFat", HKQuantityTypeIdentifier.dietaryFatTotal)]
        
        // create set of health kit quantity samples
        var quantitySamples = Set<HKQuantitySample>()
        for identifierTuple in identifiers {
            if let type = HKQuantityType.quantityType(forIdentifier: identifierTuple.1),
                let nutrient = Nutrient.nutrientForKey(identifierTuple.0, inManagedObjectContext: managedObjectContext!) {
                let quantity = HKQuantity(unit: nutrient.hkUnit, doubleValue: meal.doubleForNutrient(nutrient) ?? 0.0)
                quantitySamples.insert(HKQuantitySample(type: type, quantity: quantity, start: meal.dateOfCreation! as Date, end: meal.dateOfCreation! as Date, metadata: mealMetaData))
            }
        }
        
        // Combine nutritional data (the quantity samples) into a food correlation which represents a meal
        if let correlationType = HKObjectType.correlationType(forIdentifier: HKCorrelationTypeIdentifier.food) {
            return HKCorrelation(type: correlationType, start: meal.dateOfCreation! as Date, end: meal.dateOfCreation! as Date, objects: quantitySamples, metadata: mealMetaData)
        }
        return nil
    }
    

    
    
    private class func deleteOrUpdateMeal(_ meal: Meal, sychronisationMode: HealthManagerSynchronisationMode) {
        if !HKHealthStore.isHealthDataAvailable() {
            //            let error = NSError(domain: "UPP.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            print("HealthKit is not available in this Device")
            return;
        }
        
        print("About to delete the meal with object ID: \(meal.objectID)")
        
        let predicate = HKQuery.predicateForObjects(withMetadataKey: "CoreDataObjectIDAsURIString", allowedValues: [meal.objectID.uriRepresentation().absoluteString])
        
        if let sampleType = HKSampleType.correlationType(forIdentifier: HKCorrelationTypeIdentifier.food) {
            let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: 0, sortDescriptors: nil, resultsHandler: { (sampleQuery, results, error ) -> Void in
                if let results = results {
                    let foodCorrelations = results.compactMap{ $0 as? HKCorrelation }.filter { $0.correlationType == HKCorrelationType.correlationType(forIdentifier: HKCorrelationTypeIdentifier.food)! as HKCorrelationType }
                    
                    // for each food correlation delete its objects and the correlation itself
                    for foodCorrelation in foodCorrelations {
                        // delete the food correlation objects
                        for object in foodCorrelation.objects {
                            healthKitStore.delete(object, withCompletion: {(success, error) -> Void in
                                if success {
                                    return
                                }
                            })
                        }
                        // delete the food correlation itself
                        healthKitStore.delete(foodCorrelation, withCompletion: {(success, error) -> Void in
                            if success {
                                print("Deleted a food correlation.")
                                return
                            }
                            print("Error. Could not delete a food correlation.")
                        })
                    }
                    //                    saveMeal(meal)
                    print("This is where I want to create the food data")
                }
                if sychronisationMode == .update {
                    saveMeal(meal)
                }
            })
            // 5. Execute the Query
            healthKitStore.execute(sampleQuery)
        } else {
            // No corresponding meal found
            if sychronisationMode == .update {
                saveMeal(meal)
            }
        }
    }
    
    private class func deleteMeal(_ meal: Meal) {
        if !HKHealthStore.isHealthDataAvailable() {
//            let error = NSError(domain: "UPP.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            print("HealthKit is not available in this Device")
            return;
        }
        
        print("About to delete the meal with object ID: \(meal.objectID)")
        
        let predicate = HKQuery.predicateForObjects(withMetadataKey: "CoreDataObjectIDAsURIString", allowedValues: [meal.objectID.uriRepresentation().absoluteString])
        
        if let sampleType = HKSampleType.correlationType(forIdentifier: HKCorrelationTypeIdentifier.food) {
            let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: 0, sortDescriptors: nil, resultsHandler: { (sampleQuery, results, error ) -> Void in
                if let results = results {
                    let foodCorrelations = results.compactMap{ $0 as? HKCorrelation }.filter { $0.correlationType == HKCorrelationType.correlationType(forIdentifier: HKCorrelationTypeIdentifier.food)! as HKCorrelationType }
                    
                    // for each food correlation delete its objects and the correlation itself
                    for foodCorrelation in foodCorrelations {
                        // delete the food correlation objects
                        for object in foodCorrelation.objects {
                            healthKitStore.delete(object, withCompletion: {(success, error) -> Void in
                                if success {
                                    return
                                }
                            })
                        }
                        // delete the food correlation itself
                        healthKitStore.delete(foodCorrelation, withCompletion: {(success, error) -> Void in
                            if success {
                                print("Deleted a food correlation.")
                                return
                            }
                            print("Error. Could not delete a food correlation.")
                        })
                    }
                    print("This is where I want to create the food data")
                }
                print("Executed health delete query")
            })
            // 5. Execute the Query
            healthKitStore.execute(sampleQuery)
        } else {
            // No corresponding meal found
            print("The second place I want to create the food data")
        }
    }

}
