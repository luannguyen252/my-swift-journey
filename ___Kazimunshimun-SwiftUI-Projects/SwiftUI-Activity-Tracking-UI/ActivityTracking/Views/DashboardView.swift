//
//  DashboardView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                
                VStack {
                    Text("5674")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.appBlue)
                    Text("Steps")
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                
                VStack {
                    Text("1107")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.appBlue)
                    Text("kCal")
                }
            }
        }
    }
}
