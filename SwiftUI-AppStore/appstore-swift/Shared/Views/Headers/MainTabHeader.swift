//
//  MainTabHeader.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct MainTabHeader<L: View, T: View>: View {
  let leadingContent: L
  let trailingContent: T

  var body: some View {
    HStack {
      leadingContent
      Spacer()
      trailingContent
    }
  }
}

struct MainTabHeader_Previews: PreviewProvider {
  static var previews: some View {
    MainTabHeader(leadingContent: Text("Testing"), trailingContent: Text("More"))
      .previewLayout()
  }
}
