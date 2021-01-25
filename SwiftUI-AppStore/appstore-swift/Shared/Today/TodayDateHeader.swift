//
//  TodayDateHeader.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct TodayDateHeader: View {
  let formatter: DateFormatter = {
    let f = DateFormatter()
    f.locale = Locale.autoupdatingCurrent
    f.setLocalizedDateFormatFromTemplate("EEEE, MMMM dd")
    return f
  }()

  var body: some View {
    Text(formatter.string(from: Date()))
      .font(Font.body.smallCaps())
      .foregroundColor(.gray)
  }
}

struct TodayDateHeader_Previews: PreviewProvider {
    static var previews: some View {
        TodayDateHeader()
    }
}
