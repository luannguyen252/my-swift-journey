//
//  ViewExtensions.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 14/12/2020.
//

import SwiftUI

extension View {
  
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
