//
//  DispatchQueue-RunAfter.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

/// Helper method to run a task after a specific amount of time
public extension DispatchQueue {
    static func runAfter(_ delay: Double, execute work: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            work()
        }
    }
}
