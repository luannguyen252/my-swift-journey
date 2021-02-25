//
//  Stepper_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 6/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Stepper_Intro : View {
    @State private var stepperValue = 1
    @State private var values = [0, 1]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title).foregroundColor(.gray)
            Text("The Stepper can be bound to a variable like this:")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
                .font(.title)
            Stepper(value: $stepperValue) {
                Text("Bound Stepper: \(stepperValue)")
            }.padding(.horizontal)
            Divider()
            Image(systemName: "bolt.fill").font(.title).foregroundColor(.yellow)
            Text("Or you can run code on the increment and decrement events:")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
                .font(.title)
            Stepper(onIncrement: {self.values.append(self.values.count)},
                    onDecrement: {self.values.removeLast()}) {
                        Text("onIncrement and onDecrement")
            }.padding(.horizontal)
            HStack {
                ForEach(values, id: \.self) { value in
                    Image(systemName: "\(value).circle.fill")
                }
            }.font(.title).foregroundColor(.green)
        }
    }
}

struct Stepper_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Stepper_Intro()
    }
}
