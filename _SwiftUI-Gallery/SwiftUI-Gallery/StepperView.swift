//
//  StepperView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct StepperView: View {
    @State var count: Int = 0
    
    var body: some View {
        Stepper(value: $count,
                in: 0...10,
                label: {Text("Stepper: \(count)") })
            .padding()
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
