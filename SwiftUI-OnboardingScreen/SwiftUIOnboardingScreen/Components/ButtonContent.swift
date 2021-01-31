//
//  ButtonContent.swift
//  SwiftUIOnboardingScreen
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ButtonContent: View {
    // MARK: - BODY
    var body: some View {
        Image(systemName: "arrow.right")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color.orange)
            .cornerRadius(30)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ButtonContent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonContent()
    }
}
#endif
