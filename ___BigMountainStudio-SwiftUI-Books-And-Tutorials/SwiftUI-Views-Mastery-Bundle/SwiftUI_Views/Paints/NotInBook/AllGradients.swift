//
//  AllGradients.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 2/22/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AllGradients: View {
    // 1. Define your gradient colors
    let gradientColors = Gradient(colors: [Color.pink, Color.purple])
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Gradients")
                .font(.largeTitle)
            
            Text("Define your gradient colors and then use them for different gradient types with start and end points:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.black)
            
            HStack(spacing: 40) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("1. topLeading")
                    Text("2. top")
                    Text("3. topTrailing")
                    Text("4. leading")
                    Text("5. center")
                    Text("6. trailing")
                    Text("7. bottomLeading")
                    Text("8. bottom")
                    Text("9. bottomTrailing")
                }
                .font(.body)
                
                Image("Unit")
            }
            
            HStack(spacing: 20) {
                Rectangle()
                    .fill(AngularGradient(gradient: gradientColors,
                                          center: .center,
                                          angle: .degrees(67)))
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: .bottomLeading,
                                         endPoint: .topTrailing))
                
                Rectangle()
                    .fill(RadialGradient(gradient: gradientColors,
                                         center: .topTrailing,
                                         startRadius: 10, endRadius: 220))
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct AllGradients_Previews: PreviewProvider {
    static var previews: some View {
        AllGradients()
    }
}
