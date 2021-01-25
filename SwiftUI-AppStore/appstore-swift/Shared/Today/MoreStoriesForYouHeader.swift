//
//  MoreStoriesForYouHeader.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct MoreStoriesForYouHeader: View {
  var body: some View {
    MainTabHeader(leadingContent:
                    Text("More Stories For You")
                    .font(.title)
                    .fontWeight(.bold)
                  , trailingContent: EmptyView())
  }
}

struct MoreStoriesForYouHeader_Previews: PreviewProvider {
  static var previews: some View {
    MoreStoriesForYouHeader()
  }
}
