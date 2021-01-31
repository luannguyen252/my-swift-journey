//
//  HostingController.swift
//  SwiftUIBankCardAnimation2
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// Using this to provide .lightContent status bar style
class HostingController<T: View>: UIHostingController<T> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
