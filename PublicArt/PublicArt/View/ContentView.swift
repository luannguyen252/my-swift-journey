//
//  ContentView.swift
//  PublicArt
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var artworks = artData
    @State private var hideVisited = false
    
    // MARK: - SHOW ARTWORK
    var showArt: [Artwork] {
        hideVisited ? artworks.filter { $0.reaction == "" } : artworks
    }
    
    // MARK: - SET LOCATION ARTWORK
    private func setReaction(_ reaction: String, for item: Artwork) {
        if let index = artworks.firstIndex(
            where: { $0.id == item.id }) {
            artworks[index].reaction = reaction
        }
    }

    // MARK: - BODY
    var body: some View {
        // MARK: - NAVIGATION VIEW
        NavigationView {
            // MARK: - ARTWORK LIST
            List(showArt) { artwork in
                NavigationLink(destination: DetailView(artwork: artwork)) {
                    Text("\(artwork.reaction) \(artwork.title)")
                        .onAppear() { artwork.load() }
                        .contextMenu {
                            Button("Love it: 💕") {
                                self.setReaction("💕", for: artwork)
                            }
                            Button("Thoughtful: 🙏") {
                                self.setReaction("🙏", for: artwork)
                            }
                            Button("Wow!: 🌟") {
                                self.setReaction("🌟", for: artwork)
                            }
                        }
                }
            }
            .navigationBarTitle("Artworks")
            .navigationBarItems(trailing: Toggle(isOn: $hideVisited, label: { Text("Hide Visited") }))
            
            // MARK: - DETAIL VIEW
            DetailView(artwork: artworks[0])
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
