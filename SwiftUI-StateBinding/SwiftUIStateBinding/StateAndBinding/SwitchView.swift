//
//  SwitchView.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct SwitchView: View {
    // MARK: - PROPERTIES
    @Binding var switchIsOn: Bool
    
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $switchIsOn, label: {
            Text(switchIsOn ? "ON" : "OFF")
        })
        .fixedSize().padding()
    }
}

// MARK: - PREVIEW
#if DEBUG
struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView(switchIsOn: .constant(false))
    }
}
#endif
