//
//  Home.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct Home: View {
    var screen = NSScreen.main!.visibleFrame

    var body: some View {
        HStack(spacing: 0) {
            SideView()
            MainView()
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.2, height: screen.height - 60)
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
