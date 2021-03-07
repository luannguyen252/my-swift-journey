//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Nicholas Fox on 6/5/19.
//  Copyright © 2019 Nick Fox. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol : View {

    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)

    }
}

#if DEBUG
struct RotatedBadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
#endif
