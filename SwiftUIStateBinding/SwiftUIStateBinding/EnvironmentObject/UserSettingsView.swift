//
//  UserSettingsView.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct UserSettingsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var settings: UserSettings
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("My name: \(settings.name)")
                .font(.largeTitle)
            
            EditView()
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
#if DEBUG
struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
#endif
