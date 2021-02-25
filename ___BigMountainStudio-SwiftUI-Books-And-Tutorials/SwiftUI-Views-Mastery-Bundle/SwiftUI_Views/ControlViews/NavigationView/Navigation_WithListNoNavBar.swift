//
//  List_WithNavigation.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 2/21/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_WithListNoNavBar: View {
    @State var books = ["The Way of Kings", "Words of Radiance", "Oathbringer"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Brandon Sanderson Books").font(.title)) {
                    ForEach(books, id: \.self) { book in
                        NavigationLink(destination: BookDetail(bookItem: book)) {
                            Text(book).font(Font.system(size: 24)).padding()
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Book List") // Your back button text
            .navigationBarHidden(true)
        }
    }
}

struct BookDetail: View {
    var bookItem: String!
    
    var body: some View {
        VStack {
            Text("Book Details").font(.title)
                .frame(maxWidth: .infinity).padding()
                .background(Color("Theme3ForegroundColor"))
                .foregroundColor(Color("Theme3BackgroundColor"))
            Spacer()
            Text(bookItem).font(.title)
            Spacer()
        }.navigationTitle(bookItem)
    }
}

struct Navigation_WithListNoNavBar_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_WithListNoNavBar()
    }
}
