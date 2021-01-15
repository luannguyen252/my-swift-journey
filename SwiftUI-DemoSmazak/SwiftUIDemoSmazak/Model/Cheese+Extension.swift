//
//  Cheese+Extension.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Foundation
import SwiftUI

extension Cheese: Identifiable {
    var id: Int {
        date.hashValue
    }
    
    var localizedName: LocalizedStringKey {
        switch type {
        case .ermine:
            return "ERMINE"
        case .standard:
            return "STANDARD"
        }
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
    
    var formattedWeight: String {
        let numberFormatter = NumberFormatter()
        return numberFormatter.string(from: NSNumber(value: weight))! + " " + "g"
    }
    
    var formattedPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencyCode = currencyCode
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: price)) ?? ""
    }
}
