//
//  ImageView.swift
//  LazyVGrid
//
//  Created by Rudrank Riyam on 23/06/20.
//

import SwiftUI

struct ImageView: View {
  var number: Int
  var body: some View {
    Image("noaa\(number)")
      .resizable()
      .cornerRadius(24)
      .scaledToFit()
      .padding([.horizontal, .bottom])
      .shadow(radius: 5)
  }
}

struct ImageView_Previews: PreviewProvider {
  static var previews: some View {
    ImageView(number: 1)
  }
}
