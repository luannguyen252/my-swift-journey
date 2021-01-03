//
//  NavigatorView.swift
//  OnboardingApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct NavigatorView: View {
    // MARK: - PROPERTIES
    @Binding var selectedTab: Tab
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                withAnimation {
                    switch selectedTab {
                    case .meditating:
                        selectedTab = .running
                    case .running:
                        selectedTab = .walking
                    case .walking:
                        return
                    }
                }
            }) {
                Image(systemName: "arrow.right")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(30)
            }
        } //: HSTACK
        .padding()
    }
}
