//
//  DaysView.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import SwiftUI

struct DaysView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Day.start, ascending: true)],
        animation: .default) private var days: FetchedResults<Day>
    
    var body: some View {
        
        List {
            ForEach(days, id: \.self) { day in
                Text("Item at \(day.start!, formatter: itemFormatter)")
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            EditButton()
            
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            print("ok")
            Day.createWith(start: Date(), end: Date(), using: viewContext)
            print("sup?")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { days[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView()
    }
}
