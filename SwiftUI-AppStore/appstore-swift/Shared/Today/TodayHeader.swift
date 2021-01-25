//
//  TodayHeader.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct TodayHeader<Content: View>: View {
  let trailingContent: Content
  
  var body: some View {
    MainTabHeader(
      leadingContent:
        Text("Today")
        .font(.title)
        .fontWeight(.bold)
      , trailingContent: trailingContent)
  }
}

struct TodayHeader_Previews: PreviewProvider {
  static var previews: some View {
    TodayHeader(trailingContent: Text("Trailing"))
      .previewLayout()
  }
}
