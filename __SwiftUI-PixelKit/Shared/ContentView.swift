//
//  ContentView.swift
//  Shared
//
//  Created by Anton Heestand on 2021-01-15.
//

import SwiftUI
import PixelKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("PixelKit with SwiftUI")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                LazyVGrid(columns: [GridItem].init(repeating: GridItem(), count: 3)) {
                    TiltShift().boxLink(name: "Tilt Shift")
                    Monochrome().boxLink(name: "Monochrome")
                    ColorTriangle().boxLink(name: "Color Triangle")
                    VideoMask().boxLink(name: "Video Mask")
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
                .ignoresSafeArea()
            PlayPreviews()
        }
    }
}
