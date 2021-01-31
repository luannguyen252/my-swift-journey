//
//  EditView.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct EditView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var settings: UserSettings
    
    // MARK: - BODY
    var body: some View {
        TextField("Type in your name", text: $settings.name).textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

// MARK: - PREVIEW
#if DEBUG
struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
#endif
