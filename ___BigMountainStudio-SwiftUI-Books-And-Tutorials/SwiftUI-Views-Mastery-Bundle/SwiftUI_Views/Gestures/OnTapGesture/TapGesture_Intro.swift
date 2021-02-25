//
//  TapGesture_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TapGesture_Intro: View {
    @State private var hasDoubleTapped = false
    @State private var hasTripleTapped = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Tap Gesture").foregroundColor(.gray)
            Text("Tap gestures can make views similar to buttons. The user can tap a view and you can perform some action. But where they are different is that you can specify HOW MANY TAPS before the action happens.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.pink)
            
            Text("Double-tap the envelope to open")
            
            Image(systemName: hasDoubleTapped ? "envelope.open.fill" : "envelope.fill")
                .font(.system(size: 100))
                .padding()
                .foregroundColor(hasTripleTapped ? .orange : .pink)
                .onTapGesture(count: 2) {
                    self.hasDoubleTapped.toggle()
                }
        }.font(.title)
    }
}

struct TapGesture_Intro_Previews: PreviewProvider {
    static var previews: some View {
        TapGesture_Intro()
    }
}
