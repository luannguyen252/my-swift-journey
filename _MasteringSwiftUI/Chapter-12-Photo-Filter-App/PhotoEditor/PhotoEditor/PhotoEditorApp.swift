//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

@main
struct PhotoEditorApp: App {
    // MARK: - PROPERTIES
    @StateObject var imageController = ImageController()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(imageController)
        }
    }
}
