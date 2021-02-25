//
//  VideoPlayerViewModel.swift
//  Youtube Transition (iOS)
//
//  Created by Balaji on 13/01/21.
//

import SwiftUI

class VideoPlayerViewModel: ObservableObject {

    // MiniPlayer Properties...
    @Published var showPlayer = false
    
    // Gesture Offset..
    @Published var offset: CGFloat = 0
    @Published var width: CGFloat = UIScreen.main.bounds.width
    @Published var height : CGFloat = 0
    @Published var isMiniPlyer = false
}

