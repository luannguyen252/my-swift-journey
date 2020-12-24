//
//  ActivityDataView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ActivityDataView: View {
    // MARK: - PROPERTIES
    @StateObject var activityManger = ActivityManager()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.appWhite)
                .ignoresSafeArea()
            
            VStack {
                // Top view with date
                TopView()
                // activity menu view
                ActivityMenuView()
                // activity graph view
                ActivityGraphView()
                // activity value view
                ActivityValueView()
                
                Spacer()
            } //: VSTACK
            .padding(.horizontal)
        } //: ZSTACK
        .environmentObject(activityManger)
    }
}

// MARK: - PREVIEW
struct ActivityDataView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDataView()
    }
}
