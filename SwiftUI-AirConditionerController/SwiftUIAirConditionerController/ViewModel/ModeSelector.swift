//
//  ModeSelector.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
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
