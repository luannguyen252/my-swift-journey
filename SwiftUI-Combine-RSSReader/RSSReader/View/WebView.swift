//
//  WebView.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/23.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
	
	let url: URL
	
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		let req = URLRequest(url: url)
		uiView.load(req)
	}
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://myrealtrip.com")!)
    }
}
