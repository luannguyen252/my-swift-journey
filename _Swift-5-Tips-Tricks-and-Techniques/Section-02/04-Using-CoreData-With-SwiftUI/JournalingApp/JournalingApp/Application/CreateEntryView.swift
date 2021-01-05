//
//  CreateEntryView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 18.01.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct CreateEntryView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentation
    
    @State var title = ""
    @State var text = ""
    @State var date = Date()
    @State var categoryIndex = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Entry text", text: $text)
                DatePicker(selection: $date) {
                    Text("Entry date")
                }
            }
            Section(header: Text("Choose category")) {
                Picker("", selection: $categoryIndex) {
                    ForEach(Category.allCases, id: \.rawValue) { category in
                        Text(category.name)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationBarTitle("Create Entry", displayMode: .inline)
        .navigationBarItems(leading: Button("Cancel") {
            self.presentation.wrappedValue.dismiss()
        }, trailing: Button("Save") {
            let newEntry = Entry(context: self.managedObjectContext)
            newEntry.title = self.title
            newEntry.text = self.text
            newEntry.created = self.date
            newEntry.category = Category(rawValue: self.categoryIndex)!
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
            self.presentation.wrappedValue.dismiss()
        })
    }
}

struct CreateEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateEntryView()
        }
    }
}
