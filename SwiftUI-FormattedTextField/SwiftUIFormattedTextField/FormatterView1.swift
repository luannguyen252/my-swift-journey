//
//  FormatterView1.swift
//  SwiftUIFormattedTextField
//
//  Created by Toomas Vahter on 18.04.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct FormatterView1: View {
    @State var limits: TemperatureLimits
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Low")
                TextField("Low", value: $limits.low, formatter: NumberFormatter.decimal)
            }
            VStack {
                Text("High")
                TextField("High", value: $limits.high, formatter: NumberFormatter.decimal)
            }
            Button(action: {
                self.limits.low = Int.random(in: 0...40)
                self.limits.high = Int.random(in: 50...100)
            }, label: {
                Text("Randomise")
            })
            Text("Current: \(limits.low) - \(limits.high)")
            Spacer()
        }.padding()
            .multilineTextAlignment(.center)
    }
}

struct FormatterView1_Previews: PreviewProvider {
    static var previews: some View {
        FormatterView1(limits: TemperatureLimits())
    }
}
