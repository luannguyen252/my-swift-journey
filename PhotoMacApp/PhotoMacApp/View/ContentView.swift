//
//  ContentView.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        Home()
        //: SET LIGHT THEME
         .preferredColorScheme(.light)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: HIDEING FOCUS RING
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
