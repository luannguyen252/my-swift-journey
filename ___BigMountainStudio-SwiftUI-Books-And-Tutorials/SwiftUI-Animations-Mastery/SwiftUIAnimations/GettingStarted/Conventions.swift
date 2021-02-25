//
//  Conventions.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI
// My example template
struct Conventions: View {
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Title")
            SubtitleText("SubtitleText")
            BannerText("Banner text.")
            
        }.font(.title)
    }
}

struct Conventions_Previews: PreviewProvider {
    static var previews: some View {
        Conventions()
    }
}
