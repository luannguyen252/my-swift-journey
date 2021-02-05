//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by An Trinh on 15/12/2020.
//

import SwiftUI

@main
struct scrumdingerApp: App {
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }
    }
}
