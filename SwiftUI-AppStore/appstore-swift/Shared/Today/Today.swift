//
//  Today.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct Today: View {
  var body: some View {
    GeometryReader { geo in
      ScrollView(.vertical) {
        VStack(spacing: 0) {
          VStack(spacing: 0) {
            HStack {
              TodayDateHeader()
              Spacer()
            }
            TodayHeader(trailingContent: Text("Header"))
              .padding([.top, .bottom], 8)
            Divider()
          }
          TodayGrid(within: geo.size.width, contents: Array(repeating: .hero, count: 6))
            .padding([.top, .bottom], 25)

          Divider()
          MoreStoriesForYouHeader()
            .padding([.top, .bottom], 15)
          ForEach(0 ..< 3) { _ in
            TodayGrid(within: geo.size.width, contents: Array(repeating: .list, count: 6))
          }
          .padding([.bottom], 51)

          FooterButtons()
          Divider()
          Text("Terms & Conditions >")
        }
      }
    }
    .padding([.top, .bottom])
    .padding([.leading, .trailing], 51)
  }
}

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
      .previewLayout()
  }
}
