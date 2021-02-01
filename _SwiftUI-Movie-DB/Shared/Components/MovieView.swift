//
//  MovieView.swift
//  Movie-DB-SwiftUI
//
//  Created by Vidhyadharan on 29/12/20.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieView: View {
    let movie: Movie
    let height: CGFloat
    
    init(movie: Movie, height: CGFloat = .infinity) {
        self.movie = movie
        self.height = height
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            KFImage(URL(string: "\(Constants.Image.baseUrl)\(movie.posterPath!)"))
                .resizable()
                .scaledToFill()
                .frame(height: self.height)
                .contentShape(Rectangle())
                .clipped()

            Text(movie.title ?? "Missing Title")
                .foregroundColor(Color.black)
                .padding(.horizontal, 8)
            Spacer()
        }

    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = PersistenceController.preview.viewContext.insertMovie()
        return List {
            MovieView(movie: movie)
            MovieView(movie: movie)
            MovieView(movie: movie)
            MovieView(movie: movie)
        }
    }
}
