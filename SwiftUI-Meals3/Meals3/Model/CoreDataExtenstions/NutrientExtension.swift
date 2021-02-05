//
//  NutrientExtension.swift
//  meals
//
//  Created by Uwe Petersen on 29.03.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData
import HealthKit


extension Nutrient {

    var hkUnit: HKUnit {
        return HKUnit(from: unit!)
    }
    
    
    // TODO: make dispUnit non-optional. Uwe, this is mandatory
    var hkDispUnit: HKUnit {
        return HKUnit(from: dispUnit!)
    }
    
    var hkDispUnitText: String {
        return hkDispUnit.description.replacingOccurrences(of: "mc", with: "µ", options: [], range: nil)
    }
    
    
    public class func fetchAllNutrients(managedObjectContext context: NSManagedObjectContext) -> [Nutrient]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Nutrient")
        do {
            if let nutrients = try context.fetch(request) as? [Nutrient] {
                return nutrients
            }
        } catch {
            print("Error fetching nutrients: \(error)")
        }
        return nil
    }

    
    class func nutrientForKey(_ key:String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> Nutrient? {
        
        let request: NSFetchRequest<Nutrient> = Nutrient.fetchRequest()
        request.predicate = NSPredicate(format:"key = %@", key)
        
        do {
            let nutrients = try managedObjectContext.fetch(request)
            if nutrients.count > 1 {
                print("\(#file): more than one nutrient found for key " + key)
            }
            return nutrients.first
        } catch {
            print("Error fetching nutrients: \(error)")
        }
        return nil
    }
    
    /// Return the value as a String in the unit specified by hkDispUnit in nutrients, e.g. "12.3 µg"
    /// If something fails, either nil or an empty unit string (e.g. "g") is returned, depending on showUnit
    func valueForDisp(_ dispString: String, formatter: NumberFormatter) -> Double? {
        if let dispValue = formatter.number(from: dispString)?.doubleValue {
            return HKQuantity(unit: hkDispUnit, doubleValue: dispValue).doubleValue(for: hkUnit)
//            return HKQuantity(unit: self.hkDispUnit, doubleValue: dispValue).doubleValueForUnit(self.hkUnit) ?? nil
        }
        return nil
    }

    /// Returns a String for a given value of this nutrient in the unit specified by the dispUnit property of the nutrient, e.g. returns "12.3 µg"
    /// If something fails, either nil or an empty unit string (e.g. "g") is returned, depending on the showUnit parameter
    ///
    /// - parameter key: key of the nutrient, e.g. "totalCarb"
    /// - parameter value: value in original units of the nutrient, e.g. 12.3
    /// - parameter formatter: an NSNumberformatter
    /// - parameter showUnit: decides, whether the returned string will contain the dispUnit (a property of the nutrient) or not, e.g. "12 µg" or just "12"
    /// - parameter managedObjectContext: a NSManagedObjectContex
    func dispStringForValue(_ value: Double?, formatter: NumberFormatter, showUnit: Bool = true) -> String? {
        
        if let value = value {
            let quantity = HKQuantity(unit: hkUnit, doubleValue: value).doubleValue(for: hkDispUnit)
            if let text = formatter.string(from: NSNumber(value: quantity as Double)) {
                if showUnit {
                    return text + " " + hkDispUnitText
                } else {
                    return text
                }
            }
        }
        return showUnit ? hkDispUnitText : nil
    }
    
    /// Returns a String for a given value of the Nutrient with a given key in the unit specified by the dispUnit property of the nutrient, e.g. returns "12.3 µg"
    /// If something fails, either nil or an empty unit string (e.g. "g") is returned, depending on the showUnit parameter
    ///
    /// - parameter key: key of the nutrient, e.g. "totalCarb"
    /// - parameter value: value in original units of the nutrient, e.g. 12.3
    /// - parameter formatter: an NSNumberformatter
    /// - parameter showUnit: decides, whether the returned string will contain the dispUnit (a property of the nutrient) or not, e.g. "12 µg" or just "12"
    /// - parameter managedObjectContext: a NSManagedObjectContex
    // TODO: hier geht's weiter

    class func dispStringForNutrientWithKey(_ key: String, value: Double?, formatter: NumberFormatter, showUnit: Bool = true, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> String? {
        
        if let nutrient = nutrientForKey(key, inManagedObjectContext: managedObjectContext) {
            if let value = value {
                let quantity = HKQuantity(unit: nutrient.hkUnit, doubleValue: value).doubleValue(for: nutrient.hkDispUnit)
                if let text = formatter.string(from: NSNumber(value: quantity as Double)) {
                    if showUnit {
                        return text + " " + nutrient.hkDispUnitText
                    } else {
                        return text
                    }
                }
            }
            return showUnit ? nutrient.hkDispUnitText : nil
        }
        return nil
    }
    
}
