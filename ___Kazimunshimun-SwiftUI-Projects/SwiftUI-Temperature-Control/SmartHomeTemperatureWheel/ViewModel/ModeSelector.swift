//
//  ModeSelector.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 26/9/20.
//

import SwiftUI

class ModeSelector: ObservableObject {
    @Published var modes = Data.modeData
    var selectedModeIndex = -1
    
    func selectMode(index: Int) {
        modes[index].selected.toggle()
        
        if selectedModeIndex != -1 {
            modes[selectedModeIndex].selected.toggle()
        }
        
        selectedModeIndex = index
    }
}
