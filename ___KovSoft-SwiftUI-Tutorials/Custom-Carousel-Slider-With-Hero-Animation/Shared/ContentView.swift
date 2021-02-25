//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 27/12/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeModel = CarouselViewModel()
    var body: some View {

        Home()
        // Using it as Environment Object...
            .environmentObject(homeModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
