//
//  ActivityDataView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ActivityDataView: View {
    @StateObject var activityManger = ActivityManager()
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
            }
            .padding(.horizontal)
        }
        .environmentObject(activityManger)
    }
}

struct ActivityDataView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDataView()
    }
}
