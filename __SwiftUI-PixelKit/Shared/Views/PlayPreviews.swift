//
//  PlayPreviews.swift
//  PixelKit SwiftUI
//
//  Created by Anton Heestand on 2021-02-04.
//

import SwiftUI

struct PlayPreviews: View {
    @State var playing: Bool = false
    var preview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    var body: some View {
        Label("Play Preview", systemImage: "play.fill")
            .font(.system(size: 20, weight: .bold, design: .monospaced))
            .padding(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .colorInvert()
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                }
                .shadow(radius: 10)
            )
            .padding()
            .opacity(preview && !playing ? 1.0 : 0.0)
        .onAppear {
            RunLoop.current.add(Timer(timeInterval: 0.1, repeats: false, block: { _ in
                playing = true
            }), forMode: .common)
        }
    }
}

struct PlayPreviews_Previews: PreviewProvider {
    static var previews: some View {
        PlayPreviews()
    }
}
