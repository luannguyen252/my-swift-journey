//
//  ContentView.swift
//  SwiftUIVPNApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
