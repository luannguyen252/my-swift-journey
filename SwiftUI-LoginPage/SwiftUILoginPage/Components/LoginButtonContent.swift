//
//  LoginButtonContent.swift
//  SwiftUILoginPage
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct LoginButtonContent: View {
    // MARK: - BODY
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct LoginButtonContent_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonContent()
    }
}
#endif
