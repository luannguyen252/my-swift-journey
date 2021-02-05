//
//  DetailView.swift
//  BookWorm
//
//  Created by Sandesh on 12/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    var book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showDeleteAlert = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geo.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(self.book.author ?? "Unknown Auothor")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(self.book.review ?? "No review")
                .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                Spacer()
                Text("Added on: \(self.date())")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        .alert(isPresented: $showDeleteAlert) {
            Alert(title: Text("Delete Book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Yes"), action: {
                self.delete()
            }), secondaryButton: .cancel())
        }
        .navigationBarItems(trailing: Button(action: { self.showDeleteAlert = true }){
            Image(systemName:"trash")
        })
    }
    
    func delete() {
        moc.delete(book)
        try? moc.save()
        presentationMode.wrappedValue.dismiss()
    }
    
    // challenge 3 part 2
    func date() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: book.date ?? Date())
    
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let moc  = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Fault in out stars"
        book.author = "Nicole Haugrty"
        book.rating = 4
        book.genre = "Fantasy"
        book.review = "This is a greate love story"
        return NavigationView {
            DetailView(book: book)
        }
    }
}
