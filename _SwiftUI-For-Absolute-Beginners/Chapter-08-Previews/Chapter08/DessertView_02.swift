//
//  DessertView.swift
//  Chapter08
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct DessertView: View {
    let model: DessertViewModel
    
    var body: some View {
        HStack {
            DessertImage("\(model.image)")
            VStack(alignment: .leading, spacing: 0) {
                Text("\(model.name)")
                    .fontWeight(.bold)
                HStack{
                    Text("Rating: ")
                    ForEach(0..<model.ratings) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                    ForEach(model.ratings..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                }
            }
        }
    }
    
    func DessertImage(_ image: String) -> some View {
        Image(image)
        .resizable()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
        .padding(2)
        .overlay(Circle().stroke(Color.black.opacity(0.1)))
        .shadow(radius: 3)
        .padding(4)
        .frame(width: 72, height: 72)
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView(model: .icecream)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
