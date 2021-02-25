//
//  Linear_ColorLocations.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Linear_ColorLocations: View {
    var body: some View {
        let gradientColors = Gradient(stops: [
            .init(color: .red, location: 0),
            .init(color: .orange, location: 0.75),
            .init(color: .yellow, location: 1)])
        
        let linearGradient = LinearGradient(gradient: gradientColors,
                                            startPoint: .top,
                                            endPoint: .bottom)
        
        return VStack(spacing: 20) {
            Text("Linear Gradient").font(.largeTitle)
            Text("Color Location").foregroundColor(.gray)
            Text("By default, colors in a gradient are evenly spaced. But you can customize the color 'stops' or locations when you setup the Gradient object.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.pink).foregroundColor(.black)
                .layoutPriority(1)
            
            HStack {
                VStack {
                    Text("0")
                    Spacer()
                    Text("0.75")
                        .padding(.bottom, 50)
                    Text("1")
                }
                Rectangle()
                    .fill(linearGradient)
            }
            .frame(height: 300)
            .padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Linear_ColorLocations_Previews: PreviewProvider {
    static var previews: some View {
        Linear_ColorLocations()
    }
}
