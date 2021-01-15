//
//  Country+CoreDataClass.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//
//

import Foundation
import CoreData
import CoreLocation

public class Country: NSManagedObject {

    class func create(country: CovidCountryModel) {
        let localCountry = Country(context: CoreDataManager.shared.managedObjectContext)
        
        localCountry.id = Int16(country.id)
        localCountry.name = country.name
        localCountry.confirmed = Int64(country.confirmed)
        localCountry.deaths = Int64(country.deaths)
        localCountry.recovered = Int64(country.recovered)
        localCountry.active = Int64(country.active)
        localCountry.newCases = 0
        guard let latitude = country.latitude, let longitude = country.longitude else {
            return
        }
        localCountry.latitude = latitude
        localCountry.longitude = longitude
    }
    
    func update(country: CovidCountryModel) {
        id = Int16(country.id)
        name = country.name
        confirmed = Int64(country.confirmed)
        deaths = Int64(country.deaths)
        recovered = Int64(country.recovered)
        let newActive = Int64(country.active)
        newCases = (newActive == active) ? 0 : (newActive - active)
        active = newActive
        guard let latitude = country.latitude, let longitude = country.longitude else {
            return
        }
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var confirmed: Int64
    @NSManaged public var recovered: Int64
    @NSManaged public var deaths: Int64
    @NSManaged public var active: Int64
    @NSManaged public var newCases: Int64
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
}
