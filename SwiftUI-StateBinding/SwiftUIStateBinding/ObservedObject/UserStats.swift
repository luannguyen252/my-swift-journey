//
//  UserStats.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import Combine

class UserStats: ObservableObject {
    var objectWillChange = ObservableObjectPublisher()
    
    var score = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
}
