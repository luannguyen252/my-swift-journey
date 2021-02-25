//
//  Stepper_LabelsHidden.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Stepper_LabelsHidden: View {
    @State private var stepperValue = 1
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Stepper").font(.largeTitle)
            Text("Label Options").foregroundColor(.gray)
            Text("You can declare a stepper with just a string value for the label.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
            Stepper("What is your age?", value: $stepperValue)
                .padding(.horizontal)
            
            Text("You can omit a label too. Notice how the stepper view still pushes out horizontally.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
            Stepper("", value: $stepperValue)
                .padding(.horizontal)
            
            Text("If you hide the label then no space will be reserved for it.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
            Stepper("What is your age?", value: $stepperValue)
                .padding(.horizontal)
                .labelsHidden()
        }.font(.title)
        .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
    }
}

struct Stepper_LabelsHidden_Previews: PreviewProvider {
    static var previews: some View {
        Stepper_LabelsHidden()
    }
}
