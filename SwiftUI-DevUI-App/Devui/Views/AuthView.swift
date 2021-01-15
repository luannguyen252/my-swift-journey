//
//  AuthView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI
import Resolver

struct AuthView: View {
    @InjectedObject private var auth: AuthService
    @State private var apiKey = ""
    
    var valid: Bool { !apiKey.trimmingCharacters(in: .whitespaces).isEmpty }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("app_welcome")
                .font(.largeTitle)
                .bold()
            
            VStack(spacing: 4) {
                Text("auth_intro_1")
                Text("auth_intro_2")
                    .foregroundColor(.secondary)
            }
            .font(.subheadline)
            .multilineTextAlignment(.center)
            
            SecureField("auth_key_placeholder", text: $apiKey)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(14)
            
            Button(action: { auth.saveAPIKey(apiKey) }) {
                Text("generic_next")
                    .foregroundColor(.white)
            }
            .disabled(!valid)
            .padding()
            .frame(minWidth: 120)
            .background(Color.blue)
            .opacity(valid ? 1 : 0.5)
            .cornerRadius(14)
        }
        .padding()
    }
}
