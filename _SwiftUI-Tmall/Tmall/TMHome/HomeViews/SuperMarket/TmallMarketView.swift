//
//  TmallMarketView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI
import WebKit

struct TmallMarketView: UIViewRepresentable {
    
    @Binding var html: String
    
    
    func makeUIView(context: UIViewRepresentableContext<TmallMarketView>) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<TmallMarketView>) {
        uiView.load(URLRequest(url: URL(string: html)!))
    }
    
    
    typealias UIViewType = WKWebView
    
    
 
}
