//
//  UserSettings.swift
//  Sunflower
//
//  Created by Stephen DeStefano on 9/11/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class UserSettings: ObservableObject {
    
    @Published var changePetalColor = false
    @Published var animationSpeed = 0.0
    @Published var isToggleOn = false
}


