//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI
import StoreKit

struct StoreKit_Intro: View {
    @State private var showApp = false

    var body: some View {
        VStack(spacing: 20) {
            HeaderView("StoreKit",
                       subtitle: "Introduction",
                       desc: "You can recommend other apps in the App Store by using the StoreKit within SwiftUI.")

            Button("See This App!", action: { showApp.toggle() })
        }
        .font(.title)
        .appStoreOverlay(isPresented: $showApp) {
            return SKOverlay.AppConfiguration(appIdentifier: "1482454543", position: .bottom)
        }
    }
}

struct StoreKit_Intro_Previews: PreviewProvider {
    static var previews: some View {
        StoreKit_Intro()
    }
}
