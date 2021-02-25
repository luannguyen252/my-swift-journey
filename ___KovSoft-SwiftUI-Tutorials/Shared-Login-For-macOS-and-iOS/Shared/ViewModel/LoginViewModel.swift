//
//  LoginViewModel.swift
//  SharedLogin (iOS)
//
//  Created by Balaji on 11/01/21.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    
    // Register...
    @Published var reEnter = ""
    
    // For Goto registration Page...
    @Published var gotoRegister = false
    
    // MacOS Data....
    var screen: CGRect{
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    // detecing For macOS...
    @Published var ismacOS = false
    
    init() {
        #if !os(iOS)
        self.ismacOS = true
        #endif
    }
    
    // Clearing Data When Going to Login / Register Page...
    func clearData(){
        email = ""
        password = ""
        reEnter = ""
    }
}
