//
//  WelcomeText.swift
//  SwiftUILoginPage
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct WelcomeText: View {
    // MARK: - BODY
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct WelcomeText_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeText()
    }
}
#endif
