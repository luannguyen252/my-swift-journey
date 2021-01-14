//
//  WebView.swift
//  tmp
//
//  Created by Elias Lankinen on 10/5/20.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: String
    @Binding var uiimage: UIImage?
    @Binding var snap: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        if snap {
            print("snap")
            let config = WKSnapshotConfiguration()
            config.afterScreenUpdates = false
            if let a = uiView as? WKWebView {
                a.takeSnapshot(with: config, completionHandler: {image, error in
                    DispatchQueue.main.async {
                        print("image: \(image)")
                        print("error: \(error)")
                        uiimage = image
                        snap = false
                    }
                })
            }
        }
    }
}

extension UIView {
    func setImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
