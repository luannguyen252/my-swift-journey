//
//  Popup_TheSetup.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popup_TheSetup: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("The initial setup is pretty easy. Be sure to include a ZStack as the root view because the popup will be on top of everything.", backColor: .yellow)
                
                Spacer()
                
                Button("Show Popup") {
                    // Show popup
                }
            }
            .font(.title)
        }
    }
}

struct Popup_TheSetup_Previews: PreviewProvider {
    static var previews: some View {
        Popup_TheSetup()
    }
}
