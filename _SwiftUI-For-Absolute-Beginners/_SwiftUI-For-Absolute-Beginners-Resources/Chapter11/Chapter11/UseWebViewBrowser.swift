//
//  UseWebViewBrowser.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct UseWebViewBrowser: View {
    var body: some View {
        NavigationView {
            WebViewPage("https://www.microsoft.com")
            .navigationBarTitle("Web Browser")
        }
    }
}

struct UseWebViewBrowser_Previews: PreviewProvider {
    static var previews: some View {
        UseWebViewBrowser()
    }
}
