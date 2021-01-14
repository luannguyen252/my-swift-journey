//
//  MapSearchingViewModel.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/16.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI
import MapKit
import Combine

class MapSearchingViewModel: ObservableObject {
    @Published var annotations = [MKPointAnnotation]()
    @Published var isSearching = false
    @Published var searchQuery = ""
    
    var cancellable: AnyCancellable?
    
    init() {
        print("Initializing view model")
        // combine code
        cancellable = $searchQuery.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] (searchTerm) in
                self?.performSearch(query: searchTerm)
        }
    }
    
    fileprivate func performSearch(query: String) {
        isSearching = true
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let localSearch = MKLocalSearch(request: request)
        localSearch.start { (resp, err) in
            guard err == nil else { return }
            
            var airportAnnotations = [MKPointAnnotation]()
            
            resp?.mapItems.forEach({ (mapItem) in
                print(mapItem.name ?? "")
                let annotation = MKPointAnnotation()
                annotation.title = mapItem.name
                annotation.coordinate = mapItem.placemark.coordinate
                airportAnnotations.append(annotation)
            })
            
            self.isSearching = false
            self.annotations = airportAnnotations
        }
    }
}
