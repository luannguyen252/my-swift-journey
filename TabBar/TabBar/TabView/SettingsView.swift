//
//  SettingsView.swift
//  TabBar
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - BODY
    var body: some View {
        // MARK: - NAVIGATION VIEW
        NavigationView {
            Text("Settings Content Here.")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.black).opacity(0.6)
                
                //: NAVIGATION TITLE
                .navigationBarTitle("Settings")
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
