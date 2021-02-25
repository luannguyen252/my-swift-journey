//
//  PageViewModel.swift
//  CoverFlow (iOS)
//
//  Created by Balaji on 17/01/21.
//

import SwiftUI

class PageViewModel: ObservableObject{
    
    // Selected tab...
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        
        Page(url: URL(string: "https://www.google.com")!),
        Page(url: URL(string: "https://www.facebook.com")!),
        Page(url: URL(string: "https://www.apple.com")!),
        Page(url: URL(string: "https://www.twitter.com")!),
        Page(url: URL(string: "https://www.gmail.com")!),
        Page(url: URL(string: "https://www.instagram.com")!),
        Page(url: URL(string: "https://www.twitter.com")!),
        Page(url: URL(string: "https://www.facebook.com")!),
        Page(url: URL(string: "https://www.apple.com")!),
        Page(url: URL(string: "https://www.gmail.com")!),
        Page(url: URL(string: "https://www.facebook.com")!),
    ]
    
    // Currently Dragging Page...
    @Published var currentPage: Page?
}
