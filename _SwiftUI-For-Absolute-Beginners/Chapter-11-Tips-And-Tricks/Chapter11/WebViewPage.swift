//
//  WebViewPage.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI
import Combine

struct WebViewPage: UIViewRepresentable {
    let theURL: String
    let triggerEvent = PassthroughSubject<WebEvent, Never>()
    
    init(_ url: String = "https://www.apple.com") {
        self.theURL = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ view: WKWebView, context: Context) {
        if let url = URL(string: theURL) {
            let request = URLRequest(url: url)
            view.load(request)
        }
    }
    
    
    // MARK: - Coordinators and Context
    func makeCoordinator() -> WebViewPage.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebViewPage
        
        init(_ parent: WebViewPage) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.triggerEvent.send(.finish)
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.triggerEvent.send(.start)
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.triggerEvent.send(.failure(error))
        }
    }
    
}


enum WebEvent {
    case start, finish, failure(Error)
}
