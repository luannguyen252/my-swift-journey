//
//  TodayGrid.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct ScreenLayout {
  enum ItemSize {
    case wide
    case narrow
  }

  enum Count {
    case three
    case two
    case one
  }

  struct Spacing {
    let horizontal: CGFloat
    let vertical: CGFloat
  }

  let count: Count
  let narrowSize: CGFloat
  let wideSize: CGFloat
  let spacing: Spacing

  init(for width: CGFloat, narrowSize: CGFloat, spacing: CGFloat) {
    self.narrowSize = narrowSize

    if width - spacing * 2.0 - narrowSize * 2.0 > 335.0 {
      count = .three
    } else if width - spacing - narrowSize > 335.0 {
      count = .two
    } else {
      count = .one
    }

    var finalHorizontalSpacing = spacing
    switch count {
    case .three:
      wideSize = width - spacing * 2.0 - narrowSize * 2.0
    case .two:
      wideSize = width - spacing - narrowSize
    case .one:
      wideSize = width
      finalHorizontalSpacing = (width - wideSize) / 2.0
    }

    self.spacing = Spacing(horizontal: finalHorizontalSpacing, vertical: spacing)
  }

  func pattern() -> UnfoldSequence<CGFloat, Int> {
    let p: [ItemSize]
    switch count {
    case .three:
      p = [.wide, .narrow, .narrow, .narrow, .wide, .narrow]
    case .two:
      p = [.wide, .narrow, .narrow, .wide]
    case .one:
      p = [.wide]
    }

    return sequence(state: 0) { state -> CGFloat? in
      let current = state
      state = (state + 1) % p.count

      switch p[current] {
      case .wide:
        return wideSize
      case .narrow:
        return narrowSize
      }
    }
  }
}

enum GridContent {
  case hero
  case list
  case promo
  case animated
}

extension GridContent {
  func content() -> some View {
    switch self {
    case .hero:
      return Text("hero")
    case .list:
      return Text("list")
    case .promo:
      return Text("Promo")
    case .animated:
      return Text("animated")
    }
  }
}

let layoutSpacing: CGFloat = 51 // constant
let fixedHeight: CGFloat = 50

struct TodayGrid: View {
  let positionSize: [(CGSize, CGFloat)]
  let contents: [GridContent]

  init(within width: CGFloat, contents: [GridContent]) {
    self.contents = contents

    let narrowSize: CGFloat = 335
    let layout = ScreenLayout(for: width, narrowSize: narrowSize, spacing: layoutSpacing)
    var pattern = layout.pattern()

    let maxTrailing = width - layout.spacing.horizontal - 2.0 /* slop */

    var pos: [(CGSize, CGFloat)] = []
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0
    for _ in contents {
      guard let s = pattern.next() else { fatalError() }
      pos.append((CGSize(width: xOffset, height: yOffset), s))
      xOffset += s
      xOffset += layout.spacing.horizontal

      if xOffset >= maxTrailing {
        xOffset = 0
        yOffset += fixedHeight + layout.spacing.vertical
      }
    }

    positionSize = pos
  }

  var body: some View {
    ZStack(alignment: .topLeading) {
      ForEach(Array(positionSize.enumerated()), id: \.0) { (index, element) in
        contents[index].content()
          .frame(width: element.1, height: fixedHeight)
          .border(Color.red)
          .padding([.top], element.0.height)
          .padding([.leading], element.0.width)
          .id(index)
      }
    }
  }
}

struct TodayGrid_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geo in
      VStack(alignment: .leading) {
        Group {
          TodayGrid(within: geo.size.width, contents: Array(repeating: .hero, count: 6))
        }
        .padding([.leading, .trailing], 5)
        .border(Color.red)

        Divider()

        TodayGrid(within: geo.size.width, contents: Array(repeating: .list, count: 6))
          .border(Color.blue)
      }
    }
    .previewLayout(PreviewLayout.fixed(width: 1366, height: 768))

    GeometryReader { geo in
      TodayGrid(within: geo.size.width, contents: Array(repeating: .promo, count: 6))
    }
    .padding([.top])
    .previewLayout(PreviewLayout.fixed(width: 768, height: 1024))
  }
}
