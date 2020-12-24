//
//  PrimaryButton.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct PrimaryButton: View {
    // MARK: - BODY
    var body: some View {
        Button(action: {
            print("Solid Button")
        }) {
            Text("Solid Button")
                .foregroundColor(.white)
                .padding(16)
                .background(Color.pink)
                .cornerRadius(8)
        }
    }
}

// MARK: - PREVIEW
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
