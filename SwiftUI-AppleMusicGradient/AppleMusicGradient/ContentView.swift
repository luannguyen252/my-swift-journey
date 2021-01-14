//
//  ContentView.swift
//  AppleMusicGradient
//
//  Created by Swapnanil Dhol on 7/18/20.
//  Copyright © 2020 Swapnanil Dhol. All rights reserved.
//
import SwiftUI

struct ContentView: View {

    @State private var animation = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var pickedImage: Image?
    private let defaultImage = Image(systemName: "sun.min")

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.baseImage(geometry, (self.pickedImage ?? self.defaultImage))
                ForEach(0..<5) { _ in
                    self.layeredImage(geometry, (self.pickedImage ?? self.defaultImage))
                }
                VisualEffect(effect: UIBlurEffect(style: .light))
                VisualEffect(effect: UIBlurEffect(style: .light))
            }
            .onTapGesture {
                self.showingImagePicker = true
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(Animation.linear(duration: 50).repeatForever()) {
                self.animation.toggle()
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: getImageFromPicker) {
            ImagePicker(image: self.$inputImage)
        }
    }

    private func getImageFromPicker() {
        guard let inputImage = inputImage else { return }
        pickedImage = Image(uiImage: inputImage)
    }

    private func layeredImage(_ geometry: GeometryProxy, _ passedImage: Image) -> some View {
        passedImage
            .resizable()
            .frame(
                width: randomFrame(geometry.size.width),
                height: randomFrame(geometry.size.width)
            )

            .opacity(0.8)
            .contrast(3)
            .blendMode(.lighten)
            .rotationEffect(.degrees(randomDouble(in: -360...360)),
                            anchor: .center)
            .offset(x: randomCGFloat(in: 0...300),
                    y: randomCGFloat(in: 0...300))
            .saturation(randomDouble(in: 1...2))
            .scaleEffect(randomCGFloat(in: 1...2))

    }

    private func baseImage(_ geometry: GeometryProxy, _ passedImage: Image) -> some View {
        passedImage
            .resizable()
            .brightness(-0.5)
            .rotationEffect(.degrees(randomDouble(in: -360...360)), anchor: .center)
            .frame(width: geometry.size.height*2, height: geometry.size.height*2)
    }

    private func randomFrame(_ base: CGFloat) -> CGFloat {
        let randomNumber = animation ? CGFloat.random(in: 0...300) : CGFloat.random(in: 0...300)
        let frame = base + randomNumber
        return frame
    }

    private func randomCGFloat(in range: ClosedRange<CGFloat>) -> CGFloat {
        let randomNumber = animation ? CGFloat.random(in: range) : CGFloat.random(in: range)
        return randomNumber
    }

    private func randomDouble(in range: ClosedRange<Double>) -> Double {
        let randomNumber = animation ? Double.random(in: range) : Double.random(in: range)
        return randomNumber
    }
}
