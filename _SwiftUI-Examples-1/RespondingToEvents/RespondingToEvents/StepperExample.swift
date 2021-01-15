//
//  StepperExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/04.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct StepperExample: View {
    @State private var age = 18
    
    var body: some View {
        VStack{
            Stepper("Enter your age", onIncrement: {
                self.age += 1
                print("Adding to age")
            }, onDecrement: {
                self.age -= 1
                print("Subtracting from age")
            })
            Text("Your age is \(age)")
        }
    }
}

struct StepperExample_Previews: PreviewProvider {
    static var previews: some View {
        StepperExample()
    }
}
