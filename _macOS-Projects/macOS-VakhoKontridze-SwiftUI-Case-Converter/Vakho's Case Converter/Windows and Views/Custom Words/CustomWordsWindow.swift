//
//  CustomWordsWindow.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/21/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

// MARK:- Special Words Widow
final class CustomWordsWindow: WindowFactory, WindowFactoryable {
    // MARK: Properties
    static let shared: CustomWordsWindow = .init()
    
    var rootView: some View {
        CustomWordsView()
            .environment(\.managedObjectContext, appDelegate.moc)
    }
    
    let rect: WindowRectParameters = .init(
        defaultSize: SpecialWordsView.Layout.window
    )
    
    let titleBar: WindowFactoryTitleBarSettings = .init(
        title: "Custom Words",
        isTransparent: true,
        titleButtons: [.close, .miniaturize, .zoom]
    )
    
    // MARK: Initialize
    private override init() {
        super.init()
    }
}

// MARK:- Create
extension CustomWordsWindow {
    func createWindow() {
        super.createWindow(sender: self)
    }
}

// MARK:- Window Delegate
extension CustomWordsWindow: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        super.saveFrame(notification)
    }
}
