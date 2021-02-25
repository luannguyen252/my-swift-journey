//
//  ActivityManager.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

class ActivityManager: ObservableObject {
    @Published var activities = Data.valueItems
    @Published var selectedActivityIndex = 0
    @Published var selectedBarIndex = -1
    
    func selectActivity(item: ValueItem) {
        if let activityIndex = activities.firstIndex(where: { $0.id == item.id }), selectedActivityIndex != activityIndex {
            activities[selectedActivityIndex].selected = false
            activities[activityIndex].selected = true
            
            if selectedBarIndex != -1 {
                activities[selectedActivityIndex].caloryData[selectedBarIndex].selected.toggle()
                selectedBarIndex = -1
            }
            selectedActivityIndex = activityIndex
        }
    }
    
    func getCaloryDataForSelectedIndex() -> [CaloryData] {
        return activities[selectedActivityIndex].caloryData
    }
    
    func selectBar(hour: String) {
        if let caloryBarIndex = getCaloryDataForSelectedIndex().firstIndex(where: { $0.hour == hour }) {
            activities[selectedActivityIndex].caloryData[caloryBarIndex].selected.toggle()
            
            if selectedBarIndex != -1, selectedBarIndex != caloryBarIndex {
                activities[selectedActivityIndex].caloryData[selectedBarIndex].selected = false
            }
            
            selectedBarIndex = caloryBarIndex
        }
    }
    
    func getSelectedActivityHour() -> String {
        var hour = ""
        
        if selectedBarIndex != -1 {
            hour = activities[selectedActivityIndex].caloryData[selectedBarIndex].hour
        }
        return hour
    }
    
    func getIsSelectedHourSelected() -> Bool {
        var selected = false
        
        if selectedBarIndex != -1 {
            selected = activities[selectedActivityIndex].caloryData[selectedBarIndex].selected
        }
        return selected
    }
}
