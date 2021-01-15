//
//  ContentView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @InjectedObject private var auth: AuthService
    
    var body: some View {
        Group {
            if auth.apiKey == nil {
                AuthView()
            } else {
                MainView()
            }
        }
    }
}
