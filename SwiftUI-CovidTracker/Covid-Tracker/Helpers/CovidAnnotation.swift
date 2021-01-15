//
//  CovidAnnotation.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import UIKit

class CovidAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    let country: Country
    
    init(country: Country) {
        self.title = country.name
        self.subtitle = """
        Confirmed: \(country.confirmed.formattedNumber).
        Deaths: \(country.deaths.formattedNumber).
        Recovered: \(country.recovered.formattedNumber)
        """
        self.coordinate = CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude)
        self.country = country
    }
}

extension CovidAnnotation {
    
    var color: UIColor {
        switch country.active {
        case 0 ..< 1000:
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 1000 ..< 10000:
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case 10000 ..< .max:
            return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        default:
            return .gray
        }
    }
}
