//
//  CovidDBService.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 13.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation
import CoreData
import Combine

final class CovidDBService {
    
    private let coreDataManager = CoreDataManager.shared
    
    func checkCountriesAndUpdate(_ countries: CovidCountryResponse) {
        countries.forEach { country in
            if let fetchedCountry = self.searchFor(country: country.attributes) {
                fetchedCountry.update(country: country.attributes)
            } else {
                Country.create(country: country.attributes)
            }
        }
        coreDataManager.saveContext()
    }
    
    func searchFor(country: CovidCountryModel) -> Country? {
        let fetchRequest = NSFetchRequest<Country>(entityName: "Country")
        
        fetchRequest.predicate = NSPredicate(format: "id == %i", Int16(country.id))
        
        let fetchedCountries = try? CoreDataManager.shared.managedObjectContext.fetch(fetchRequest)
        return fetchedCountries?.first
    }
}
