//
//  TopBarView.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
            Spacer()
            Text("Today")
            Spacer()
            Image(systemName: "bell.badge.fill")
        }
        .foregroundColor(.white)
        .font(.title)
    }
}
