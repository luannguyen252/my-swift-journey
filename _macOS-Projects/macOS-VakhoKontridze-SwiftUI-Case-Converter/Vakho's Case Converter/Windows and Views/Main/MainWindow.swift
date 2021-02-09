//
//  MainWindow.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/12/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

// MARK:- Main Window
final class MainWindow: WindowFactory, WindowFactoryable {
    // MARK: Properties
    static let shared: MainWindow = .init()
    
    var rootView: some View {
        MainView()
            .environmentObject(appDelegate.settings)
    }
    
    let rect: WindowRectParameters = .init(
        savesOrigin: false,
        savesSize: false, defaultSize: MainView.Layout.window
    )
    
    let titleBar: WindowFactoryTitleBarSettings = .init(
        title: AppDelegate.appName,
        isTransparent: true,
        titleButtons: [.close]
    )
    
    // MARK: Initialize
    private override init() {
        super.init()
    }
}

// MARK:- Create
extension MainWindow {
    func createWindow() {
        super.createWindow(sender: self)
    }
}

// MARK:- Window Delegate
extension MainWindow: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        super.saveFrame(notification)
        AppDelegate.terminateApp()
    }
}
