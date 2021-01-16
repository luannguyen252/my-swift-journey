//
//  OffsetView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct OffsetView: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.green)

            Circle()
                .foregroundColor(.blue)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Title")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Subtitle 1")
                        .font(.subheadline)
                    Spacer()
                    Text("Subtitle 2")
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct OffsetView_Previews: PreviewProvider {
    static var previews: some View {
        OffsetView()
    }
}
