//
//  appstore_swiftApp.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

extension View {
  func previewLayout() -> some View {
    self.previewLayout(PreviewLayout.fixed(width: 1024, height: 768))
  }
}

@main
struct appstore_swiftApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
