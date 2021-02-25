//
//  LongPress_MaximumDistance.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LongPress_MaximumDistance: View {
    @State private var isLongPress = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Long Press - Max Distance").foregroundColor(.gray)
            Text("If you want to give users more room to long press then add a maximum distance.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            Text("Long press to open")
            
            Image(systemName: isLongPress ? "lock.open.fill" : "lock.fill")
                .font(.system(size: 100))
                .padding()
                .foregroundColor(isLongPress ? .red : .orange)
                .onLongPressGesture(maximumDistance: 100) { // I'm actually not seeing this make a difference
                    self.isLongPress.toggle()
            }
            .padding(100)
            .border(Color.orange)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}
struct LongPress_MaximumDistance_Previews: PreviewProvider {
    static var previews: some View {
        LongPress_MaximumDistance()
    }
}
