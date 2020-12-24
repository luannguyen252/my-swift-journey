//
//  DashboardView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var dashboardManager: DashboardManager
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            HexagoanRounded()
                .fill(ColorConstants.hexagonLinear)
                .frame(height: 340)
            
            Circle()
                .fill(ColorConstants.circle)
                .frame(width: 180, height: 180)
                .shadow(color: Color.white.opacity(0.15), radius: 20, x: -10, y: -10)
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 10, y: 10)
            
            VStack {
                Text(dashboardManager.dashboardMenus[dashboardManager.selectedMenuIndex].currentValue)
                    .font(.system(size: 50))
                    .foregroundColor(ColorConstants.textCirclePrimary)
                
                Text(dashboardManager.dashboardMenus[dashboardManager.selectedMenuIndex].unit)
                    .foregroundColor(ColorConstants.textCircleSecendary)
            } //: VSTACK
            
            HStack(spacing: 30) {
                Image(systemName: "ellipsis")
                    .rotationEffect(Angle.degrees(90))
                    .fixedSize()
                    .frame(width: 20, height: 60)
                
                HStack(spacing: 140) {
                    VStack(spacing: 140) {
                        Image(systemName: dashboardManager.dashboardMenus[0].name)
                            .font(.system(size: 30))
                            .foregroundColor(dashboardManager.selectedMenuIndex == 0 ? ColorConstants.selectedColor : ColorConstants.unselectedBackground)
                            .onTapGesture {
                                dashboardManager.selectMenu(index: 0)
                            }
                        
                        Image(systemName: dashboardManager.dashboardMenus[1].name)
                            .font(.system(size: 30))
                            .foregroundColor(dashboardManager.selectedMenuIndex == 1 ? ColorConstants.selectedColor : ColorConstants.unselectedBackground)
                            .onTapGesture {
                                dashboardManager.selectMenu(index: 1)
                            }
                    } //: VSTACK
                    
                    VStack(spacing: 140) {
                        Image(systemName: dashboardManager.dashboardMenus[2].name)
                            .font(.system(size: 30))
                            .foregroundColor(dashboardManager.selectedMenuIndex == 2 ? ColorConstants.selectedColor : ColorConstants.unselectedBackground)
                            .onTapGesture {
                                dashboardManager.selectMenu(index: 2)
                            }
                        Image(systemName: dashboardManager.dashboardMenus[3].name)
                            .font(.system(size: 30))
                            .foregroundColor(dashboardManager.selectedMenuIndex == 3 ? ColorConstants.selectedColor : ColorConstants.unselectedBackground)
                            .onTapGesture {
                                dashboardManager.selectMenu(index: 3)
                            }
                    } //: VSTACK
                } //: HSTACK
                
                Text("Analyze")
                    .rotationEffect(Angle.degrees(-90))
                    .fixedSize()
                    .frame(width: 20, height: 60)
            } //: HSTACK
            .foregroundColor(ColorConstants.unselectedBackground)
        } //: ZSTACK
    }
}
