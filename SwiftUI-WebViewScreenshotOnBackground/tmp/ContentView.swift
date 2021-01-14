//
//  ContentView.swift
//  tmp
//
//  Created by Elias Lankinen on 10/5/20.
//

import SwiftUI
import CoreData
extension View {
    func takeScreenshotView(rect: CGRect) -> UIImage {
        let window = UIWindow(frame: rect)
        let hosting = UIHostingController(rootView: self)
        window.rootViewController = hosting
        window.makeKeyAndVisible()
        return hosting.view.setImage(rect: rect)
    }
}
struct ContentView: View {
    @State var image: UIImage?
    @State var snap: Bool = false
    var body: some View {
        let a = WebView(url: "https://lankinen.xyz", uiimage: $image, snap: $snap).frame(width: 250, height: 250)
        VStack {
            a
            Button("Snap") {
                print("take screenshot")
                snap = true
                let screenSize: CGRect = UIScreen.main.bounds
                print("screen size: \(screenSize)")
            }
            if image != nil {
                Image(uiImage: image!)
            }
        }
        .padding()
        .background(Color.green)
    }
}
