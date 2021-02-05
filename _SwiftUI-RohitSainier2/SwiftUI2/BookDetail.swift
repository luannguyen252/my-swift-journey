//
//  BookDetail.swift
//  SwiftUI2
//
//  Created by Rohit Saini on 28/06/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    let book:Book
    var body: some View {
        ScrollView{
        VStack{
            Image(book.imageUrl)
            .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .padding()
            VStack(alignment: .leading){
                Text(book.name)
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                    .padding()
                Text(book.description)
                    .font(.body)
                    .foregroundColor(Color.gray)
                 .padding()
            }
            
        }
        .navigationBarTitle(Text(book.name),displayMode: .large)
    }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: Book(name: "Dummy", description: "Dummy Dummy Dummy", imageUrl: "algo"))
    }
}
