//
//  ContentView.swift
//  SwiftUIHeroCarouselSlider
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeModel = CarouselViewModel()
    
    var body: some View {
        Home()
            .environmentObject(homeModel) // Using as Environment Object
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
