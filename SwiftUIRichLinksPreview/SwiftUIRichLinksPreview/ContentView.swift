//
//  ContentView.swift
//  SwiftUIRichLinksPreview
//
//  Created by Luan Nguyen on 05/01/2021.
//

import SwiftUI

struct Link: Identifiable{
    var id = UUID()
    var string: String
}

struct ContentView: View {
    let links: [Link] = [
        "https://www.youtube.com/watch?v=65JrtwtTOdc",
        "https://developer.apple.com/swift/",
        "https://twitter.com/SwiftUICourse/status/1343495200023302144"   
    ]
    .map {
        Link(string: $0)
    }

    var body: some View {
        NavigationView {
            List {
                Section(footer: Text("")) {
                    ForEach(links) {
                        link in
                        LinkCell(url: URL(string: link.string)!)
                    }
                }
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .navigationBarTitle("Links")
            .environment(\.defaultMinListRowHeight, 250)
        }
    }

    private func setReaction(_ reaction: String, for link: Link) { }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
