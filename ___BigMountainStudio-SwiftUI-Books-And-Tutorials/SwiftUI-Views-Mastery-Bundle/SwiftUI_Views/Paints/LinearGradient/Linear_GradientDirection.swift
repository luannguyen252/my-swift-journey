//
//  Linear_StartEnd.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Linear_GradientDirection: View {
    let gradientColors = Gradient(colors: [Color.pink, Color.black])
    
    var body: some View {
        VStack(spacing: 20) {
            Text("LinearGradient")
                .font(.largeTitle)
            
            Text("Gradient Direction")
                .foregroundColor(.gray)
            
            Text("Gradient direction is set using the startPoint and endPoint parameters. You use the UnitPoint type for the parameter values. Points include:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
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
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: .leading,
                                         endPoint: .bottom))
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: .bottomLeading,
                                         endPoint: .topTrailing))
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: .bottomTrailing,
                                         endPoint: .leading))
                    .frame(width: 100, height: 100)
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Linear_GradientDirection_Previews: PreviewProvider {
    static var previews: some View {
        Linear_GradientDirection()
    }
}
