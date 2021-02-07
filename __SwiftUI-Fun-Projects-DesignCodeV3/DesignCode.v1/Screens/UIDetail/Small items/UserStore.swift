//
//  UserStore.swift
//  DesignCode.v3
//
//  Created by Tee Becker on 11/8/20.
//

import SwiftUI
import Combine

class UserStore: ObservableObject{
    
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet{
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    } // condition to show Avatar /menu or not
    
    @Published var showLogin = false // show or hide the login screen
}
