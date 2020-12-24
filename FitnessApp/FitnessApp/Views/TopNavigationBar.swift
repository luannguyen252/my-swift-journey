//
//  TopNavigationBar.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TopNavigationBar: View {
    @State var showHeartRateView = false
    @EnvironmentObject var dashboardManager: DashboardManager
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(systemName: "rectangle.leftthird.inset.fill")
                    .resizable()
                    .frame(width: 20, height: 10)
                Text(dashboardManager.dashboardMenus[dashboardManager.selectedMenuIndex].title)
            }
            .foregroundColor(ColorConstants.textCircleSecendary)
            
            Spacer()
            
            Button(action: {
                showHeartRateView = true
            }, label: {
                FourCircleView()
            })
        }
        .sheet(isPresented: $showHeartRateView) {
            HeartRateSettingsView()
        }
    }
}

struct FourCircleView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .invertedRectangleNeomorphify(bottomOffset: -1)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(spacing: 14) {
                VStack(spacing: 14) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                }
                VStack(spacing: 14) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                }
            }
        }
        .frame(width: 60, height: 60)
    }
}
