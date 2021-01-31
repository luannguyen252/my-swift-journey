//
//  WiFiView.swift
//  SwiftUIiOS14Onboarding
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct WiFiView: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    @State var showEnterPasswordView = false
    
    // MARK: - BODY
    var body: some View {
        List {
            Section {
                VStack(spacing: 24) {
                    HStack {
                        Spacer()
                        Image(systemName: "wifi")
                            .font(.system(size: 72))
                            .foregroundColor(Color("AccentColor"))
                        Spacer()
                    }
                    
                    Text("Choose a Wi-Fi Network")
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(
                colorScheme == .light ?
                    Color(UIColor.secondarySystemBackground) :
                    Color(UIColor.systemBackground)
            )
            
            Section {
                ForEach(networks, id: \.self) { network in
                    Button(action: { showEnterPasswordView = true }) {
                        HStack {
                            Text(network)
                                .font(.headline)
                            
                            Spacer()
                            
                            Image(systemName: "lock.fill")
                                .font(.caption)
                            
                            Image(systemName: "wifi")
                                .font(.caption)
                        }
                        .padding(.vertical, 12)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $showEnterPasswordView) {
                        WiFiPasswordView()
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

#if DEBUG
struct WiFiView_Previews: PreviewProvider {
    static var previews: some View {
        WiFiView()
    }
}
#endif
