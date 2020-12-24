//
//  Components.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct Components: View {
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 16) {
            PrimaryButton()
        }
    }
}

// MARK: - PREVIEW
struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
