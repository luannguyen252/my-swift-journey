//
//  Utility.swift
//  SwiftUIBook
//
//  Created by muukii on 2020/07/01.
//  Copyright © 2020 muukii. All rights reserved.
//

import UIKit

// extension for keyboard to dismiss
extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
