//
//  TabButton.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

struct TabButton: View {
    // MARK: - PROPERTIES
    var title: String
    @Binding var tab: String

    // MARK: - BODY
    var body: some View {
        Button(action: {tab = title}) {
            HStack(spacing: 4){
                Image(title)
                    .renderingMode(.template)
                    .foregroundColor(tab == title ? .white : .gray)
                Text(tab == title ? title : "")
                    .foregroundColor(.white)
                    .font(.body)
                    .fontWeight(.semibold)
            } //: HSTACK
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(Color("color").opacity(tab == title ? 1 : 0))
            .clipShape(Capsule())
        } //: BUTTON
    }
}
