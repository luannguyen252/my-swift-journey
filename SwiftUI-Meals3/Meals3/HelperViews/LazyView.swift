//
//  LazyView.swift
//  Meals3
//
//  Created by Uwe Petersen on 28.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

/// Creates a lazy view from view.
///
/// Helpful for use of `NavigationLink` within `list`, where destination views are loaded immediately even when the user hasn’t navigated to that view.
/// Embedding the destination view in LazyView makes the destination view lazy and speeds up performance significantly for long lists.
///
/// # Example for usage:
/// ```Swift
/// NavigationLink(destination: LazyView(Text("Detail Screen"))){
///    Text("Tap me to see detail screen!")
/// }
/// ```
///
/// Source: [Blog post by Anupam Chugh on Medium]( https://medium.com/better-programming/swiftui-navigation-links-and-the-common-pitfalls-faced-505cbfd8029b). Thank you!!!!
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
