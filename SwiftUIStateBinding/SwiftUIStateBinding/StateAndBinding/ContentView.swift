//
//  ContentView.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var switchIsOn = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text(switchIsOn ? "🤓" : "😎")
                .font(.system(size: 100))
            
            SwitchView(switchIsOn: $switchIsOn)
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
