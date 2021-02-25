//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 06/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        Home()
        // always light Theme
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Hiding Focus Ring...

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}

