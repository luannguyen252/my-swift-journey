//
//  detailTop.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct detailTop: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Forest")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                    Text("Camping")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                }
                Spacer()
                Text("$299")
                    .foregroundColor(Color("bg"))
                    .font(.largeTitle)
            } //: HSTACK
        } //: VSTACK
        .padding()
    }
}
