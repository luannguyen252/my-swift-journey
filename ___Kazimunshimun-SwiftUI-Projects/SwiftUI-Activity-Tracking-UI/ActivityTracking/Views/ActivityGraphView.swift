//
//  ActivityGraphView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ActivityGraphView: View {
    @EnvironmentObject var manager: ActivityManager
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(height: 360)
                .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
            
            HStack {
                // scale view
                CaloryScaleView()
                    .offset(x: 10, y : -12)
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            // data graph
                            ActivityGraphsView()
                            // view for selecting individual graph hour item value
                            GraphItemSelectionView()
                        }
                        .frame(height: 300)
                        // hour item
                        HoursItemView()
                    }
                }
            }
        }
    }
}

struct CaloryScaleView: View {
    var body: some View {
        VStack {
            Text("500 cal")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
            
            Text("250 cal")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
            
            Text("0 cal")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
        }
        .font(.system(size: 14))
        .foregroundColor(Color.gray.opacity(0.5))
    }
}
