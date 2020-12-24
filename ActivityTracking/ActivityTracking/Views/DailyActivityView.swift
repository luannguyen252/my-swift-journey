//
//  DailyActivityView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct DailyActivityView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(height: 200)
                .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Daily Activity")
                    .font(.system(size: 22, weight: .semibold))
                
                HStack(spacing: 30) {
                    ActivityItemView(activityItem: Data.activityItems[0])
                    
                    ActivityItemView(activityItem: Data.activityItems[1])
                    
                    ActivityItemView(activityItem: Data.activityItems[2])
                } //: HSTACK
            } //: VSTACK
        } //: ZSTACK
    }
}

// MARK: - ACTIVITY ITEM
struct ActivityItemView: View {
    // MARK: - PROPERTIES
    let activityItem: ActivityItem
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    .frame(width: 80, height: 80)
                
                Circle()
                    .trim(from: 0.0, to: activityItem.progress)
                    .stroke(activityItem.color, lineWidth: 3)
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(-90))
                
                Image(systemName: activityItem.imageName)
                    .foregroundColor(activityItem.color)
                    .rotationEffect(.degrees(activityItem.imageRoataion))
            } //: ZSTACK
            
            Text(activityItem.title)
                .font(.system(size: 14))
        } //: VSTACK
    }
}
