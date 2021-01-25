//
//  TimerModel.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/24/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import Combine

public enum TimerState {
    case running
    case paused
}

class TimerModel {
    
    // define some variables
    public var timer = Timer.publish(every: 1, on: .current, in: .common)
    private var cancelable: Cancellable?
    
    // define some functions
    public func start() {
        cancelable = timer.connect()
    }
    
    public func stop() {
        guard let cTimer = cancelable else {return}
        cTimer.cancel()
        timer = Timer.publish(every: 1, on: .current, in: .common)
    }
    
}
