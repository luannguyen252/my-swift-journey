//
//  ProfileView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI
import Resolver

struct ProfileView: View {
    @StateObject private var model = ProfileViewModel()
    
    var signOutButton: some View {
        Button(action: model.signOut) {
            Text("generic_sign_out")
        }
        .foregroundColor(.red)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let error = model.error {
                    VStack {
                        Text(NSLocalizedString(error.localizedDescription, comment: ""))
                    }
                } else if let profile = model.profile {
                    VStack(spacing: 16) {
                        NetworkImage(url: profile.imageURL)
                            .scaledToFit()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 120, alignment: .center)
                            .clipShape(Circle())
                            .accessibility(hidden: true)
                        Text(profile.username)
                            .font(.title)
                        Text(profile.summary)
                            .italic()
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                } else {
                    ProgressView()
                }
            }
            .padding()
            .navigationTitle("section_profile")
            .navigationBarItems(trailing: signOutButton)
        }
    }
}

