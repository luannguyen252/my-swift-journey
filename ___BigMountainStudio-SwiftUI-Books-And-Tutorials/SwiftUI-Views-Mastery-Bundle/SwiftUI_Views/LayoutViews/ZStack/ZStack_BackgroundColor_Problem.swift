//
//  ZStack_BackgroundColor_Problem.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ZStack_BackgroundColor_Problem: View {
    var body: some View {
        ZStack {
            Color.gray
            
            VStack(spacing: 20) {
                Text("ZStack") // This view is under the notch
                    .font(.largeTitle)
                
                Text("Ignores Safe Area Edges")
                    .foregroundColor(.white)
                
                Text("Having the ZStack edges ignoring the safe area edges might be a mistake. \nYou notice that the top Text view is completely under the notch.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                
                Spacer() // Added a spacer to push the views up.
            }
            .font(.title)
        }
        .ignoresSafeArea()
    }
}


struct ZStack_BackgroundColor_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_BackgroundColor_Problem()
    }
}
