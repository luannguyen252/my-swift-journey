//
//  WelcomeText.swift
//  LoginPage
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct WelcomeText: View {
    // MARK: - PROPERTIES
    @State var welcomeText: String
    
    // MARK: - BODY
    var body: some View {
        Text(welcomeText)
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct WelcomeText_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeText(welcomeText: "Welcome!")
    }
}
#endif
