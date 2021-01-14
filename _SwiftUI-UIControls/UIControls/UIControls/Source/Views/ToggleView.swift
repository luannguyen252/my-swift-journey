//
//  ToggleView.swift
//  UIControls
//
//  Created by Sud on 6/17/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct ToggleView : View {
    @State var isOn: Bool = false
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $isOn) {
                    Text(self.isOn ? "Is ON" : "Is OFF")
                }
            }
        }
        .navigationBarTitle(Text("Toggle"))
    }
}

#if DEBUG
struct ToggleView_Previews : PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
#endif
