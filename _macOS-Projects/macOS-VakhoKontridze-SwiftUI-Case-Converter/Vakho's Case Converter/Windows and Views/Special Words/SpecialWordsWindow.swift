//
//  SpecialWordsWindow.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/13/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

// MARK:- Special Words Widow
final class SpecialWordsWindow: WindowFactory, WindowFactoryable {
    // MARK: Properties
    static let shared: SpecialWordsWindow = .init()
    
    var rootView: some View {
        SpecialWordsView()
    }
    
    let rect: WindowRectParameters = .init(
        defaultSize: SpecialWordsView.Layout.window
    )
    
    let titleBar: WindowFactoryTitleBarSettings = .init(
        title: "Articles, Prepositions, and Conjunctions",
        isTransparent: true,
        titleButtons: [.close, .miniaturize, .zoom]
    )
    
    // MARK: Initialize
    private override init() {
        super.init()
    }
}

// MARK:- Create
extension SpecialWordsWindow {
    func createWindow() {
        super.createWindow(sender: self)
    }
}

// MARK:- Window Delegate
extension SpecialWordsWindow: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        super.saveFrame(notification)
    }
}
