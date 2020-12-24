//
//  DashboardView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                
                VStack {
                    Text("4096")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.appBlue)
                    Text("Steps")
                } //: VSTACK
            } //: ZSTACK
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                
                VStack {
                    Text("1024")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.appBlue)
                    Text("kCal")
                } //: VSTACK
            } //: ZSTACK
        } //: HSTACK
    }
}
