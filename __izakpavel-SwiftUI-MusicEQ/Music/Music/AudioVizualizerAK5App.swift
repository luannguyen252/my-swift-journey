//
//  AudioVizualizerAK5App.swift
//  Music
//
//  Created by Clifton on 2021-01-18.
//


import SwiftUI

@main
struct AudioVizualizerAK5App: App {
    var body: some Scene {
        WindowGroup {
            Home().environmentObject(Conductor.shared)
        }
    }
}
