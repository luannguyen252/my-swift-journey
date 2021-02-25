//
//  AnimationQuickTip.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/3/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AnimationQuickTip: View {
    var body: some View {
        HStack {
            Text("Quick & Dirty SwiftUI Animation Secret")
        }.animation(.default)
    }
}

struct AnimationQuickTip_Previews: PreviewProvider {
    static var previews: some View {
        AnimationQuickTip()
    }
}
