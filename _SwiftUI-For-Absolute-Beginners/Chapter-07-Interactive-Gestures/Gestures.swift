//
//  Gestures.swift
//  Chapter07
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct Gestures: View {
    @State private var text = "hello"
    var body: some View {
        Text("\(text)")
        
        //Tap Gesture
        .onTapGesture(count: 2) {
            print("Text was tapped")
            self.text = "Tapped the text"
        }
        
        // Long Press Gesture
        .onLongPressGesture {
            print("Long pressed")
            self.text = "long pressed Text"
        }
    
        // Drage Gesture
        .gesture(
            DragGesture(minimumDistance: 60)
            .onEnded{ drag in
            self.text = String(describing: drag)
        }
    )
    }
}

struct Gestures_Previews: PreviewProvider {
    static var previews: some View {
        Gestures()
    }
}
