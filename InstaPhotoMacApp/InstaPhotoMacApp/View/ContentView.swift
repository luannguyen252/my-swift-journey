//
//  ContentView.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
