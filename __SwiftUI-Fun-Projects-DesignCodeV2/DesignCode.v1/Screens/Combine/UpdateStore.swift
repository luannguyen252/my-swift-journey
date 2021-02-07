//
//  UpdateStore.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/30/20.
//

import SwiftUI
import Combine

// Because Class is a reference type, if we need to change or update something, we need to make that update to the original source
class UpdateStore: ObservableObject{
    @Published var updates: [lesson] = lessons
    
    
}
