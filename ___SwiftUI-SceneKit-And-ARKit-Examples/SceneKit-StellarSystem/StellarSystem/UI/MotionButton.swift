//
//  MotionButton.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/21.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import SwiftUI

struct MotionButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color.red : Color.blue)
            .cornerRadius(8.0)
    }
}

struct MotionButton : View {
    @State private var toggleStatus:Bool = false
    
    let completion: () -> Void
    
    var body: some View {
        Button(action: {
            self.toggleStatus = !self.toggleStatus
            self.completion()
            
        }) {
            Text((toggleStatus == false) ? "Pause" : "Play")
        }
    }
}
