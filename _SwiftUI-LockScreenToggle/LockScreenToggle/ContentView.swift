//
//  ContentView.swift
//  LockScreenToggle
//
//  Created by João Gabriel Pozzobon dos Santos on 25/01/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var torchOn = false
    @State var scale: CGFloat = 1.0
    
    @State var canToggle = false
    
    var body: some View {
        ZStack {
            background
            toggle
        }
    }
    
    var background: some View {
        Image("Big Sur Graphic \(colorScheme == .dark ? "(dark)" : "(light)")")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    var toggle: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .brightness(torchOn ? 0.8 : 0)
                .mask(Circle())
            
            Image(systemName: "flashlight.\(torchOn ? "on" : "off").fill")
                .resizable()
                .foregroundColor(torchOn ? .black : .white)
                .scaledToFit()
                .padding(20)
        }.frame(width: 70, height: 70)
        .scaleEffect(scale)
        .animation(.spring(response: 0.35, dampingFraction: 0.7))
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .onChanged { _ in
                    withAnimation {
                        scale = 1.35
                    }
                }
                .onEnded { _ in
                    if canToggle {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                        
                        torchOn.toggle()
                        toggleTorch(torchOn)
                    }
                    canToggle = false
                    withAnimation {
                        scale = 1.0
                    }
                }
        ).onAnimationCompleted(for: scale, completion: {
            if scale == 1.35 {
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                canToggle = true
            }
        })
    }
}

func toggleTorch(_ on: Bool = true) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            if on == true {
                device.torchMode = .on
            } else {
                device.torchMode = .off
            }
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
