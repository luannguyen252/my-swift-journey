//
//  ContentView.swift
//  SwiftUICustomProgressBars
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // 1. Simple Progress Bar
                NavigationLink(destination: SimpleProgressBar(circleProgress: .constant(0.2), width: 200, height: 10, progressColor: .blue, staticColor: .gray)) {
                    Text("Simple Progress Bar")
                }
                
                // 2. Dashed Halved Circular Bar
                NavigationLink(destination: DashedHalvedCircularBar(circleProgress: .constant(0.2), width: 400, labelSize: 20.0, dashColor: .red, progressColor: .red, showLabel: true, lineWidth: 12.0)) {
                    Text("Dashed Halved Circular Bar")
                }
                
                // 3. Circular Progress Bar
                NavigationLink(destination: CircularProgressBar(circleProgress: .constant(0.2), widthAndHeight: 200, labelSize: 30, progressColor: .blue)) {
                    Text("Circular Progress Bar")
                }
                
                // 4. Circular Progress Bar 2
                NavigationLink(destination: CircularProgressBar2(circleProgress: .constant(0.3), widthAndHeight: 200, labelSize: 30, staticColor: .blue, progressColor: .purple, showLabel: true, lineWidth: 12.0)) {
                    Text("Circular Progress Bar 2")
                }
                
                // 5. Activity Indicator
                NavigationLink(destination: ActivityIndicator()) {
                    Text("Activity Indicator")
                }
            } //: VSTACK
            .navigationBarTitle("Progress Bar")
        } //: NAVIGATION VIEW
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
