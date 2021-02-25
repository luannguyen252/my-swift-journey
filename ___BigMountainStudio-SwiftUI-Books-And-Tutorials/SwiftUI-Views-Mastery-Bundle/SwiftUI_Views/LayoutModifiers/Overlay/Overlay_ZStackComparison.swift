//
//  Overlay_ZStackComparison.swift
//  100Views
//
//  Created by Mark Moeykens on 8/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Overlay_ZStackComparison: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color("Theme3BackgroundColor")
            
            VStack(spacing: 20) {
                Text("Overlay")
                    .font(.largeTitle)
                
                Text("Compared with ZStack")
                    .font(.title)
                    .foregroundColor(.gray)
                
                HStack {
                    Image("Overlay")
                    Image("ZStack")
                }
                
                Text("For comparison, here is the same layout but using a ZStack. The choice is yours which method you want to use.")
                    .frame(maxWidth: .infinity)
                    .padding().font(.title)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
        }
        .ignoresSafeArea()
    }
}

struct Overlay_ZStackComparison_Previews: PreviewProvider {
    static var previews: some View {
        Overlay_ZStackComparison()
    }
}
