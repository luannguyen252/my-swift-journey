//
//  WebView.swift
//  Embed YouTube Videos
//
//  Created by Leonardo Bilia on 30/03/20.
//  Copyright © 2020 Leonardo Bilia. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youTubeURL = URL(string:"https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youTubeURL))
    }
}
