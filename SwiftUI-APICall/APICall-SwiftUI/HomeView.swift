//
//  HomeView.swift
//  APICall-SwiftUI
//
//  Created by Keerthi on 27/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State var toggleIsOn = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.albums, id: \.id) { album in
                    VStack {
                        NavigationLink(destination: DetailView(album: album)) {
                            Text("\(album.title ?? "")")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        self.viewModel.albums.remove(at: index)
                    }
                }
            }
            .onAppear(perform: viewModel.getAlbumList)
            .navigationBarTitle("APICall-SwiftUI")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(provider: URLSessionProvider()))
    }
}


struct DetailView: View {
    
    @State var album: Album
    
    var body: some View {
        VStack {
            Text(album.title ?? "")
        }.onAppear {
                print("DetailView appeared!")
        }.onDisappear {
                print("DetailView disappeared!")
        }
    }
}
