//
//  ToggleSwitchExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ToggleSwitchExample: View {
    @State private var showGreeting = true
    
    var body: some View {
        VStack {
            Toggle(isOn:$showGreeting) {
                Text("Show welcome message")
            }.padding()
            
            if showGreeting {
                Text("Hello World")
            }
        }
    }
}

struct ToggleSwitchExample_Previews: PreviewProvider {
    static var previews: some View {
        ToggleSwitchExample()
    }
}
