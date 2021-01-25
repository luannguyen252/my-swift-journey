//
//  ContentView.swift
//  CartListViewWithSwiftUI
//
//  Created by park kyung suk on 2020/06/18.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name, imageName: String
}
struct ContentView: View {
    
    let movies: [[Movie]] = [
        [.init(name: "Deadpool 21", imageName: "movie1"),
         .init(name: "The Shape of Water", imageName: "movie2")],
        [.init(name: "Incredibles 2", imageName: "movie3"),
         .init(name: "Tomb Raider", imageName: "movie4")],
        [.init(name: "Deadpool 2", imageName: "movie1"),
         .init(name: "The Shape of Water", imageName: "movie2")],
        [.init(name: "Incredibles 2", imageName: "movie3"),
         .init(name: "Tomb Raider", imageName: "movie4")]
    ]
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                VStack (spacing: 16) {
                    Text("KBTA Movies")
                        .font(.system(size: 16))
                    ForEach(self.movies, id: \.self) { row in
                        HStack (spacing: 12) {
                            ForEach(row) { movie in
                                MovieView(movie: movie, size: geo.size)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
      
        
    }
}

struct MovieView: View {
    var movie: Movie
    var size: CGSize
    var body: some View {
        VStack (spacing: 8) {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (size.width - 48) / 2, height: 250)
                .cornerRadius(8)
            
            Text(movie.name)
            
            Button(action: {
                
            }) {
                Text("Buy Tickets")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
