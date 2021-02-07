//
//  ChartLabelView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

struct ChartLabelView: View {
    var text: String

    var body: some View {
        Text(text)
                .font(.caption)
                .foregroundColor(.gray)
                .opacity(text == "_" ? 0 : 1)
    }
}

