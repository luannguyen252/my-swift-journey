//
//  ContentView.swift
//  SwiftUI2
//
//  Created by Rohit Saini on 28/06/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var books:[Book] = [
        Book(name: "Introduction to Algorithms", description: "The name of the book is self-explanatory. It is what the title suggests, i.e., Introduction to Algorithms. Also known as CLRS, a reference to the last name of the authors of the book, it goes in-depth into a range of algorithms divided across several self-contained chapters.", imageUrl: "algo"),
        Book(name: "Clean Code", description: "Programming is about polishing the craft with years of trial and error. I wish there was a way to save yourself from all the hard work by learning from the mistakes of other programmers? Fortunately, there is, and it is known to the world as the Clean Code: A Handbook of Agile Software Craftsmanship book from the legendary Uncle Bob.", imageUrl: "cleancode"),
        Book(name: "Code Complete", description: "Want to know how to write robust code irrespective of the architecture of a programming language? Then consider reading the Code Complete: A Practical Handbook of Software Construction. It comprehensively covers all the aspects of the structure of good code.\nThe Code Complete book is held dearly among the best practical guides on programming. The programming book has no shortage of code examples that thoroughly illustrate the art of and science behind software development.", imageUrl: "codecomplete"),
        Book(name: "Head First Design Patterns: A Brain-Friendly Guide", description: "The Head First book series is known for its innovative way of breaking down complex topics into simpler, easy-to-understand units. The Head First Design Patterns: A Brain-Friendly Guide is compiled based on this tried-and-tested formula.\nThere is a galore of illustrative and brain-stimulating examples in the Head First Design Patterns book that will make learning both efficient and fun simultaneously. Unlike other text-heavy programming books, this book features a thought-inducing, visually-rich format.", imageUrl: "headfirst"),
        Book(name: "Refactoring: Improving the Design of Existing Code", description: "Refactoring is a vital programming concept for understanding the underlying aspects of writing clean, robust code. Martin Fowler’s Refactoring: Improving the Design of Existing Codebook covers all major refactorings that any skilled programmer must know about.\nLearning the best approaches to refactor code base allows a programmer to improve the code maintenance throughout its time, or save it from rotting, at the very least. The latest edition of refactoring features JS code examples and examples demonstrating refactoring without classes.", imageUrl: "refactor"),
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink(destination: BookDetail(book: book)){
                        BookView(book: book)
                    }
                }
            .padding()
            }
        .navigationBarTitle("Books")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK:- Book View
struct BookView: View {
    var book:Book
    var body: some View {
        HStack{
            Image(book.imageUrl)
                .resizable()
                .frame(width:100,height:100)
                .cornerRadius(16)
            VStack(alignment: .leading){
                Text(book.name)
                    .font(.headline)
                   
                
                Text(book.description)
                    .font(.subheadline)
                    .lineLimit(2)
                Spacer()
            }
        }
    }
}
