//
//  BindingExample.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/19.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct BindingExample: View {
    @State private var firstToggle = false
    @State private var secondToggle = false
    
    var body: some View {
        let firstBinding = Binding(
            get: { self.firstToggle },
            set: {
                self.firstToggle = $0

                if $0 == true {
                    self.secondToggle = false
                }
            }
        )

        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0

                if $0 == true {
                    self.firstToggle = false
                }
            }
        )

        return VStack {
            Toggle(isOn: firstBinding) {
                Text("First toggle")
            }

            Toggle(isOn: secondBinding) {
                Text("Second toggle")
            }
        }
        
    }
}

struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        BindingExample()
    }
}
