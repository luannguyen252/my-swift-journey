//
//  HorizontalGrid.swift
//  LazyVGrid
//
//  Created by Rudrank Riyam on 23/06/20.
//

import SwiftUI

struct HorizontalGrid: View {
  var rows: [GridItem] =
    Array(repeating: .init(.flexible()), count: 3)

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: rows) {
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

struct HorizontalGrid_Previews: PreviewProvider {
  static var previews: some View {
    HorizontalGrid()
  }
}
