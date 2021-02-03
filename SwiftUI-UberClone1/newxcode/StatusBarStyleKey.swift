//
//  StatusBarStyleKey.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 14/09/20.
//

import SwiftUI

struct StatusBarStyleKey: PreferenceKey {
  static var defaultValue: UIStatusBarStyle = .default
  
  static func reduce(value: inout UIStatusBarStyle, nextValue: () -> UIStatusBarStyle) {
    value = nextValue()
  }
}
