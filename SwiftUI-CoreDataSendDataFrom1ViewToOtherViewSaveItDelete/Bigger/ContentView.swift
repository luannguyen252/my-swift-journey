//
//  ContentView.swift
//  Bigger
//
//  Created by App-Designer2 . on 21.11.19.
//  Copyright © 2019 App-Designer2 . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Big.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Big.name, ascending: true),
        NSSortDescriptor(keyPath: \Big.carier, ascending: true),
        NSSortDescriptor(keyPath: \Big.saved, ascending: false)
    ]) var bigger : FetchedResults<Big>
    
    @State private var save : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Users:").font(.caption).foregroundColor(.secondary)
                ZStack {
                    
                    Group {
                        Circle().fill(Color.green)
                            .frame(width: 23, height: 23)
                        
                        Spacer()
                        Text("\(self.bigger.count)").bold().foregroundColor(.white)
                        
                    }
                    }
                }.padding(.trailing)
                
            List {
                ForEach(bigger, id: \.name) { big in
                    ZStack {
                        Rectangle().fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 70)
                            .cornerRadius(10).shadow(color: .gray, radius: 4)
                        
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 45)).foregroundColor(.red)
                            
                            VStack(alignment: .leading) {
                                Text("\(big.name ?? "")").font(.headline)
                                
                                Text("\(big.carier ?? "")").font(.subheadline)
                                    .foregroundColor(.secondary)
                                }
                            Spacer()
                            
                            Button(action: {
                                big.saved.toggle()
                                
                                try? self.moc.save()
                            }) {
                                Image(systemName: big.saved ? "bookmark.fill": "bookmark")
                            }
                        }.padding()
                    }
                }.onDelete(perform: remove)
            }
            }.navigationBarTitle("Creaters")
                .navigationBarItems(leading: Image(systemName: "square.and.arrow.up"),
                                    trailing: Button(action: { self.save.toggle()}) { Image(systemName: "plus.circle.fill")})
                .sheet(isPresented: $save) {
                    AddNew().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    func remove(at offsets : IndexSet) {
        for index in offsets {
            let delete = bigger[index]
            self.moc.delete(delete)
        }
        // To remove for the core data
        try? self.moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
