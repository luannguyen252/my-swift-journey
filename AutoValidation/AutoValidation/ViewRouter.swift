//
//  ViewRouter.swift
//  AutoValidation
//
//  Created by Luan Nguyen on 17/12/2020.
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
