//
//  SearchUserBar.swift
//  DynamicList-SwiftUI-Combine
//
//  Created by Farooq Rasheed on 04/01/2020.
//  Copyright © 2020 Farooq Rasheed. All rights reserved.
//

import SwiftUI

struct SearchUserBar: View {
    @Binding var text: String
    @State var action: () -> Void

    var body: some View {
        ZStack {
            Color.purple
            HStack {
                TextField("Github User Search", text: $text)
                    .padding([.leading, .trailing], 10)
                    .frame(height: 32)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                Button(
                    action: action,
                    label: { Text("Search") }
                    )
                    .foregroundColor(Color.white)
                }
                .padding([.leading, .trailing], 16)
            }
            .frame(height: 64)
    }
}
