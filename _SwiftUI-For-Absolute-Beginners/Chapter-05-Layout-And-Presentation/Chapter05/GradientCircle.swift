//
//  GradientCircle.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct GradientCircle: View {
    var body: some View {
        VStack {
            Image("user")
                    Circle()
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors:[.red, .blue]),
                            startPoint: .top,
                            endPoint: .bottom),
                        lineWidth: 25
            ).padding()
            
            VStack {
                Text("Jayant Varma")
                    .font(.largeTitle)
                Text("http://www.oz-apps.com")
            }
        }
    }
}
    
    struct GradientCircle_Previews: PreviewProvider {
        static var previews: some View {
            GradientCircle()
        }
}
