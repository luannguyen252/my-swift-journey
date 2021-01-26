//
//  blurView.swift
//  DatingAppMacOS
//
//  Created by Tony Hajdini on 27/07/2020.
//  Copyright © 2020 Tony Hajdini. All rights reserved.
//

import Foundation
import SwiftUI

struct VisualEffectView: NSViewRepresentable {
  func makeNSView(context: Context) -> NSVisualEffectView {
    let view = NSVisualEffectView()
    view.blendingMode = .withinWindow
    view.isEmphasized = true
    view.material = .sidebar
    return view
  }

  func updateNSView(_ nsView: NSVisualEffectView, context: Context) {

  }
}
