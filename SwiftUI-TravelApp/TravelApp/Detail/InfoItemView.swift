//
//  InfoItemView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct InfoItemView: View {
    // MARK: - PROPERTIES
    let title: String
    let description: String

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray)
            Text(description)
                .font(.system(size: 16))
        } //: VSTACK
    }
}
