//
//  InstaPhotoMacAppApp.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

@main
struct InstaPhotoMacAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// MARK: - HIDE FOCUS RING
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set {  }
    }
}
