//
//  StepperView.swift
//  UIControls
//
//  Created by Sud on 6/19/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct StepperView : View {
    @State var stepperValue = 0
    
    var body: some View {
        Form {
            Section {
                Stepper(onIncrement: {
                    self.stepperValue += 1
                }, onDecrement: {
                    self.stepperValue -= 1
                }) {
                    Text("\(self.stepperValue)")
                }
            }
        }
        .navigationBarTitle(Text("Stepper"))
    }
}

#if DEBUG
struct StepperView_Previews : PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
#endif
