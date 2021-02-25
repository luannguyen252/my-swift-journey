//
//  LongPress_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LongPress_Intro: View {
    @State private var isLongPress = false
    @State private var isPressing = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Long Press Intro").foregroundColor(.gray)
            Text("Use a long press gesture to perform some action after the user has pressed on a view for a certain amount of time.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            Text("Long press to open")
            
            Image(systemName: isLongPress ? "lock.open.fill" : "lock.fill")
                .font(.system(size: 100))
                .padding()
                .foregroundColor(isLongPress ? .red : .orange)
                .onLongPressGesture(minimumDuration: 1, pressing: { isPressing in
                    // This will keep happening while the long press is happening
                    self.isPressing = isPressing
                }) {
                    // Action to perform when the minimum duration is reached
                    self.isLongPress.toggle()
                }
            
            Text("Keep pressing!")
                .opacity(isPressing ? 1 : 0)
            
        }.font(.title)
    }
}

struct LongPress_Intro_Previews: PreviewProvider {
    static var previews: some View {
        LongPress_Intro()
    }
}
