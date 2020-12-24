//
//  DataManager.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

class DataManager: ObservableObject {
    @Published var bpmsValue = bpms
    var lastSelectedBPM = -1
    
    func selectData(bpm: Models.BPM) {
        if let foundIndex = bpmsValue.firstIndex(where: { $0.id == bpm.id }) {
            bpmsValue[foundIndex].selected.toggle()
            if (foundIndex == lastSelectedBPM) {
                lastSelectedBPM = -1
            } else {
                if lastSelectedBPM != -1 {
                    bpmsValue[lastSelectedBPM].selected.toggle()
                }
                lastSelectedBPM = foundIndex
            }
        }
    }
}
