//
//  Slider_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 6/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Slider_Intro : View {
    @State private var sliderValue = 0.5
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Slider").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Associate the Slider with an @State variable that will control where the thumb (circle) will be on the slider's track.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange).foregroundColor(Color.black)
            
            Text("Default min value is 0.0 and max value is 1.0")
            
            Slider(value: $sliderValue)
                .padding(.horizontal)
            
            Text("Value is: ") +
                Text("\(sliderValue)").foregroundColor(.orange)
            
        }.font(.title)
    }
}

struct Slider_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Slider_Intro()
    }
}
