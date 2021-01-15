//
//  VerticalGrid.swift
//  LazyVGrid
//
//  Created by Rudrank Riyam on 23/06/20.
//

import SwiftUI

struct VerticalGrid: View {
  var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 2)

  var body: some View {
    NavigationView {
      ScrollView(.vertical) {
        LazyVGrid(columns: columns) {
          ForEach((1...18), id: \.self) { number in
            ImageView(number: number)
          }
        }
      }
      .navigationTitle("Landscapes")
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct VerticalGrid_Previews: PreviewProvider {
  static var previews: some View {
    VerticalGrid()
  }
}
