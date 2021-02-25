//
//  Navigation_WithListNoNavBarNoBackButton.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 2/22/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_WithListNoNavBarNoBackButton: View {
    @State var books = ["The Way of Kings", "Words of Radiance", "Oathbringer"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Brandon Sanderson Books").font(.title)) {
                    ForEach(books, id: \.self) { book in
                        NavigationLink(destination: BookDetail_NoBack(bookItem: book)) {
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

struct BookDetail_NoBack: View {
    @Environment(\.presentationMode) var presentationMode
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
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            }
            Spacer()
        }
        .navigationTitle(bookItem)
        .navigationBarHidden(true)
    }
}

struct Navigation_WithListNoNavBarNoBackButton_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_WithListNoNavBarNoBackButton()
//        BookDetail_NoBack(bookItem: "Test Book")
    }
}
