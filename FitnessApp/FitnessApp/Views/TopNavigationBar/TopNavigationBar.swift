//
//  TopNavigationBar.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TopNavigationBar: View {
    // MARK: - PROPERTIES
    @State var showHeartRateView = false
    @EnvironmentObject var dashboardManager: DashboardManager
    
    // MARK: - BODY
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(systemName: "rectangle.leftthird.inset.fill")
                    .resizable()
                    .frame(width: 20, height: 10)
                Text(dashboardManager.dashboardMenus[dashboardManager.selectedMenuIndex].title)
            } //: VSTACK
            .foregroundColor(ColorConstants.textCircleSecendary)
            
            Spacer()
            
            Button(action: {
                showHeartRateView = true
            }, label: {
                FourCircleView()
            })
        } //: HSTACK
        .sheet(isPresented: $showHeartRateView) {
            HeartRateSettingsView()
        }
    }
}
