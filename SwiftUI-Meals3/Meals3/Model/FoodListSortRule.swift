//
//  FoodListSortRule.swift
//  meals
//
//  Created by Uwe Petersen on 08.09.15.
//  Copyright © 2015 Uwe Petersen. All rights reserved.
//

import Foundation

enum FoodListSortRule: String {
    
    case NameAscending = "Name"
    case TotalEnergyCalsDescending = "Kalorien"
    case TotalCarbDescending = "Kohlehydrate"
    case TotalProteinDescending = "Protein"
    case TotalFatDescending = "Fett"
    case GroupThenSubGroupThenNameAscending = "Gruppe"
    case FattyAcidCholesterolDescending = "Cholesterin"
    
    var sortDescriptors: [NSSortDescriptor] {
        switch self {
        case .NameAscending:
            return [NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        case .TotalEnergyCalsDescending:
            return [NSSortDescriptor(key: "totalEnergyCals", ascending: false, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        case .TotalCarbDescending:
            return [NSSortDescriptor(key: "totalCarb", ascending: false, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        case .TotalProteinDescending:
            return [NSSortDescriptor(key: "totalProtein", ascending: false, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        case .TotalFatDescending:
            return [NSSortDescriptor(key: "totalFat", ascending: false, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        case .FattyAcidCholesterolDescending:
            return [NSSortDescriptor(key: "fattyAcidCholesterol", ascending: false, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        case .GroupThenSubGroupThenNameAscending:
            //            sortDescriptors = [NSSortDescriptor(key: "group.name", ascending: true, selector: "localizedCaseInsensitiveCompare:"),
            //                NSSortDescriptor(key: "subGroup.name", ascending: true, selector: "localizedCaseInsensitiveCompare:"),
            //                NSSortDescriptor(key: "name", ascending: true, selector: "localizedCaseInsensitiveCompare:")]
            //            sectionNameKeyPath = "group.name"
            
            return [NSSortDescriptor(key: "subGroup.name", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
            //            sortDescriptors = [NSSortDescriptor(key: "key", ascending: true, selector: "localizedCaseInsensitiveCompare:")]
            //            sectionNameKeyPath = "key"
            
            //          Does not work this way and seems to be quite complicated. Need to use an extra (conputed?) property or some other technique
            //        case .FrequencyDescendingThenNameAscending:
            //            return [NSSortDescriptor(key: "countOfMealIngredients", ascending: false, selector: "localizedCaseInsensitiveCompare:")]
        }
    }
    
    var sectionNameKeyPath: String? {
        switch self {
        case .NameAscending:
            return "uppercaseFirstLetterOfName"
        case .TotalEnergyCalsDescending:
            return nil
        case .TotalCarbDescending:
            return nil
        case .TotalProteinDescending:
            return nil
        case .TotalFatDescending:
            return nil
        case .FattyAcidCholesterolDescending:
            return nil
        case .GroupThenSubGroupThenNameAscending:
            //            sectionNameKeyPath = "group.name"
            //            sectionNameKeyPath = "key"
            return "subGroup.name"
        }
    }
}
