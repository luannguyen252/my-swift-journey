//
//  MapMarker.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct MapMarker: View {
    // MARK: - PROPERTIES
    @State var animate = false
    let placeName: String

    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 10, height: 10)
            
            Circle()
                .fill(Color.red.opacity(0.2))
                .frame(width: 10, height: 10)
                .scaleEffect(animate ? 8.0 : 1.0)
                .opacity(animate ? 0.1 : 1.0)
                .animation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false))
            
            GeometryReader { geometry in
                ZStack {
                    Text(placeName)
                        .font(.system(size: 14))
                        .padding(6)
                        .background(Color.white)
                        .cornerRadius(5)
                        .fixedSize()
                } //: ZSTACK
                .offset(x: geometry.size.width/2 + 15, y: -8)
            } //: GEOMETRY READER
        } //: ZSTACK
        .onAppear {
            animate = true
        }
    }
}
