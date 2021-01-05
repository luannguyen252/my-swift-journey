//
//  ContentView.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/2/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct Home: View {
    @ObservedObject var temperaturaVM = TemperaturaViewModel()
    
    /// Initialize the temperaturaVM.
    init() {
        self.temperaturaVM = TemperaturaViewModel()
    }
    
    var body: some View {
        VStack {
            WeatherMain()
            List {
                Text("")
            }
        }
    }
}

/// Weather main detail section.
struct WeatherMain: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))]), startPoint: .bottom, endPoint: .top)
            VStack {
                Text("Balanga City")
                    .foregroundColor(.white)
                Text("32°")
                    .font(.system(size: 72.0)).bold()
                    .foregroundColor(.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: screen.height * 0.50)
    }
}

/// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
