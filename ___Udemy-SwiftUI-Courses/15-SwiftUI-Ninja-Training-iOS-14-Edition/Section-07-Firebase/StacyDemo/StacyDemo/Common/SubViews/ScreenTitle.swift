//
//  ScreenTitle.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 03/12/2020.
//

import SwiftUI

struct ScreenTitle: View {
  let title: String
  
  init(_ title: String) {
    self.title = title
  }
  
  var body: some View {
    HStack {
      Text(title)
        .font(.largeTitle)
        .bold()
        .foregroundColor(.title)
        .padding(.bottom, 30)
        .padding(.leading, 20)
      Spacer()
    }
  }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle("Hello, world!")
    }
}
