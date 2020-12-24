//
//  ActivityGraphView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ActivityGraphView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var manager: ActivityManager
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(height: 360)
                .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
            
            HStack {
                // Scale view
                CaloryScaleView()
                    .offset(x: 10, y : -12)
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            // Data graph
                            ActivityGraphsView()
                            // View for selecting individual graph hour item value
                            GraphItemSelectionView()
                        }
                        .frame(height: 300)
                        // Hour item
                        HoursItemView()
                    } //: SCROLLVIEW
                } //: VSTACK
            } //: HSTACK
        } //: ZSTACK
    }
}

// MARK: - CALARY SCALE
struct CaloryScaleView: View {
    var body: some View {
        VStack {
            Text("500 cal")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
            
            Text("250 cal")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
            
            Text("0 cal")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
        } //: VSTACK
        .font(.system(size: 14))
        .foregroundColor(Color.gray.opacity(0.5))
    }
}
