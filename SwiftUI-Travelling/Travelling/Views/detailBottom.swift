//
//  detailBottom.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct detailBottom: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .fontWeight(.heavy)
            Text("Forest Camping Experiences and Meanings Key elements of camping experience include nature, social interaction, and comfort/convenience. The most common associated meanings are restoration, family functioning")
                .foregroundColor(.gray)
            HStack(spacing: 8) {
                Button(action: {
                }) {
                    Image("Save")
                        .renderingMode(.original)
                }
                Button(action: {
                }) {
                    HStack(spacing: 6) {
                        Text("Book Your Experience")
                        Image("arrow")
                            .renderingMode(.original)
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                .background(Color("bg"))
                .cornerRadius(8)
            } //: HSTACK
            .padding(.top, 6)
        } //: VSTACK
        .padding()
    }
}
