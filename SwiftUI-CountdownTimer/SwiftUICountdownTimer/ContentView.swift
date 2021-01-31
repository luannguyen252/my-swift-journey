//
//  ContentView.swift
//  SwiftUICountdownTimer
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 10
let lineWith: CGFloat = 30
let radius: CGFloat = 70

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isActive = false
    @State private var timeRemaining: CGFloat = defaultTimeRemaining
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWith, lineCap: .round))
                
                // Time Circle
                Circle()
                    .trim(from: 0, to: 1 - ((defaultTimeRemaining - timeRemaining) / defaultTimeRemaining))
                    .stroke(timeRemaining > 6 ? Color.green : timeRemaining > 3 ? Color.yellow : Color.red, style: StrokeStyle(lineWidth: lineWith, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                // Time Remaining
                Text("\(Int(timeRemaining))").font(.largeTitle)
            } //: ZSTACK
            .frame(width: radius * 2, height: radius * 2)
            
            // Play, Pause or Resume
            HStack(spacing: 24) {
                Label("\(isActive ? "Pause" : "Play")", systemImage: "\(isActive ? "pause.fill" : "play.fill")").foregroundColor(isActive ? .red : .yellow).font(.title).onTapGesture(perform: {
                    isActive.toggle()
                })
                
                Label("Resume", systemImage: "backward.fill").foregroundColor(.black).font(.title).onTapGesture(perform: {
                    isActive = false
                    timeRemaining = defaultTimeRemaining
                })
            } //: HSTACK
        }
        // Timer Receive
        .onReceive(timer, perform: { _ in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
        })
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
