//
//  ActivityGraphsView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ActivityGraphsView: View {
    @EnvironmentObject var manager: ActivityManager
    var body: some View {
        ZStack {
            // Line graph for all 3 activity
            LineGraph(data: getCaloriesFromData(data: manager.activities[0].caloryData))
                .stroke(manager.selectedActivityIndex == 0 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedActivityIndex == 0 ? 4 : 3)
            
            LineGraph(data: getCaloriesFromData(data: manager.activities[1].caloryData))
                .stroke(manager.selectedActivityIndex == 1 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedActivityIndex == 1 ? 4 : 3)
            
            LineGraph(data: getCaloriesFromData(data: manager.activities[2].caloryData))
                .stroke(manager.selectedActivityIndex == 2 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedActivityIndex == 2 ? 4 : 3)
            // Filled line graph for selected activity
            LineGraph(data: getCaloriesFromData(data: manager.activities[manager.selectedActivityIndex].caloryData))
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.appBlue.opacity(0.5), Color.appBlue.opacity(0.01)]),
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
    }
    
    func getCaloriesFromData(data: [CaloryData]) -> [CGFloat] {
        var calories: [CGFloat] = []
        
        for item in data {
            calories.append(item.value)
        }
        
        return calories
    }
}

struct HoursItemView: View {
    var body: some View {
        HStack(spacing: 40) {
            ForEach(Data.valueItems[0].caloryData) { data in
                Text(data.hour)
                    .frame(width: 50, alignment: .center)
            }
        }
        .font(.system(size: 14))
        .foregroundColor(Color.gray.opacity(0.5))
    }
}
