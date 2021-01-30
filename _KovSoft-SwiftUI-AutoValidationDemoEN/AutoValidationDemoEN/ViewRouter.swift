//
//  ViewRouter.swift
//  AutoValidationDemoEN
//
//  Created by Farukh IQBAL on 31/03/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import Foundation
import SwiftUI
import AudioToolbox

class ViewRouter: ObservableObject {
    
    @Published var enteredPin = "" {
        didSet {
            if self.enteredPin == pin {
                self.currentPage = "home"
            } else if enteredPin.count >= 4 {
                enteredPin = ""
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { return }
            }
        }
    }
    
    @Published var currentPage = "pin"
    
}
