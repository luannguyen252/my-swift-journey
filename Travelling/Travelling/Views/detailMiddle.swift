//
//  detailMiddle.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct detailMiddle: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 5) {
                Image("map")
                    .renderingMode(.original)
                Text("Kecamatan Klojen")
                    .foregroundColor(Color("bg"))
            } //: HSTACK
            HStack(spacing: 8) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundColor(.yellow)
                }
            } //: HSTACK
            Text("People")
                .fontWeight(.heavy)
            Text("Number Of People In Your Group")
                .foregroundColor(.gray)
            HStack(spacing: 6) {
                ForEach(0..<5) { i in
                    Button(action: {
                    }) {
                        Text("\(i + 1)")
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .background(Color("bg"))
                    .cornerRadius(8)
                }
            } //: HSTACK
        } //: VSTACK
        .padding(.horizontal,15)
    }
}
