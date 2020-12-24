//
//  LazyVGrid.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct LazyVGrids: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(), .init()]) {
                ForEach(0..<10) { _ in
                    GroupBox(
                        label: Label("Heart Rate", systemImage: "heart.fill")
                            .foregroundColor(.red)
                    ) {
                        Text("Your hear rate is 90 BPM.")
                    }
                }
            }.padding()
        }
    }
}

struct LazyVGrids_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrids()
    }
}
