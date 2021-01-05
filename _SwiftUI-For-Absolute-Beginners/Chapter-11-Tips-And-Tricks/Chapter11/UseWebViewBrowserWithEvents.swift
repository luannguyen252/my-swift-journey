//
//  UseWebViewBrowserWithEvents.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct UseWebViewBrowserWithEvents: View {
    let webPage = WebViewPage("https://www.microsoft.com")
    var body: some View {
        NavigationView {
            webPage
                .onReceive(webPage.triggerEvent){ event in
                    print("Got : \(event)")
            }
        }
    }
}

struct UseWebViewBrowserWithEvents_Previews: PreviewProvider {
    static var previews: some View {
        UseWebViewBrowserWithEvents()
    }
}
