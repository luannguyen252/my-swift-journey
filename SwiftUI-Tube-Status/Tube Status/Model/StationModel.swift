//
//  StationModel.swift
//  Tube Status
//
//  Created by Clarence Ji on 6/19/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI
import Combine

final class StationModel: ObservableObject {
    
    let objectWillChange = PassthroughSubject<StationModel, Never>()
    
    var stations: [Station] = [] {
        willSet {
            isFetching = false
            objectWillChange.send(self)
        }
    }
    
    var isFetching: Bool = false {
        willSet {
            objectWillChange.send(self)
        }
    }
    
    private var cancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    func fetch(line: Line) {
        
        _ = TfLService.loadStations(on: line)
            .sink(receiveValue: { (stations) in
                DispatchQueue.main.async { [weak self] in
                    self?.stations = stations
                }
            })
        
    }
    
}
