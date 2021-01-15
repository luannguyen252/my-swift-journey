//
//  FormatterView2.swift
//  SwiftUIFormattedTextField
//
//  Created by Toomas Vahter on 18.04.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

struct FormatterView2: View {
    @State var limits: TemperatureLimits
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Low")
                NumberTextField("Low", value: $limits.lowNumber, formatter: NumberFormatter.decimal)
            }
            VStack {
                Text("High")
                NumberTextField("High", value: $limits.highNumber, formatter: NumberFormatter.decimal)
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

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        return formatter
    }
}

struct FormatterView2_Previews: PreviewProvider {
    static var previews: some View {
        FormatterView2(limits: TemperatureLimits())
    }
}
