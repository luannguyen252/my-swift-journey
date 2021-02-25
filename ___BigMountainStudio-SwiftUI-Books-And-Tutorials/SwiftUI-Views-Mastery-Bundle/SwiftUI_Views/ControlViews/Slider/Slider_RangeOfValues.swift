//
//  Slider_RangeOfValues.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 12/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Slider_RangeOfValues: View {
    @State private var age = 18.0
    
    let ageFormatter: NumberFormatter = {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .spellOut
        return numFormatter
    }()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Slider").font(.largeTitle)
            Text("Range of Values").foregroundColor(.gray)
            Text("You can also set your own min and max values.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange).foregroundColor(Color.black)
            
            Text("What is your age?")
            
            Slider(value: $age, in: 1...100, step: 1)
                .padding(.horizontal)
            
            Text("Age is: ") +
                Text("\(ageFormatter.string(from: NSNumber(value: age))!)")
                    .foregroundColor(.orange)
        }.font(.title)
    }
}

struct Slider_RangeOfValues_Previews: PreviewProvider {
    static var previews: some View {
        Slider_RangeOfValues()
    }
}
