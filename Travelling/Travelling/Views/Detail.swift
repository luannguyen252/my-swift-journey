//
//  Detail.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct Detail: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            Image("topbg")
                .resizable()
                .aspectRatio(1.35, contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 500).offset(y: -200).padding(.bottom, -200)
            GeometryReader { geo in
                VStack(alignment: .leading) {
                   detailTop()
                   detailMiddle()
                   detailBottom()
                } //: VSTACK
            } //: GEOMETRY READER
            .background(Color.white)
            .clipShape(Rounded())
            .padding(.top, -75)
        } //: VSTACK
    }
}
