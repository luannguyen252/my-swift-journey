//
//  MovieDetail.swift
//  iMovie
//
//  Created by Sandesh on 14/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    
    var body: some View {
        
        ZStack {
            Image("\(movie.id)")
                .resizable()
                .renderingMode(.original)
                .frame (maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Spacer()
                DetailView(movie: movie)
                .padding()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
    
    
    
}

struct DetailView: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("\(movie.title)")
                .font(.title)
                .lineLimit(2)
                .padding([.leading, .trailing,.top], 10)
            Text(date)
                .padding([.leading, .trailing], 10)
            Text("👑 \(String(format: "%.2f", movie.popularity))")
             .padding([.leading, .trailing], 10)
            Text(movie.overview)
                .padding([.leading, .trailing, .bottom])
        }
        .background(Color(UIColor.systemBackground.withAlphaComponent(0.9)))
        .cornerRadius(10)
    }
    
    var date: String {
        Calendar.shared.convertString(date: movie.release_date, from: "yyyy-MM-dd", to: "MMM d, yyyy") ?? "-"
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetail(movie: Movie.getMovies().first!)
        }
    }
}
