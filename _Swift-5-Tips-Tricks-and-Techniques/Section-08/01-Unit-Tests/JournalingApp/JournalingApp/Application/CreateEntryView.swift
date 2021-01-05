//
//  CreateEntryView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 18.01.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct CreateEntryView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State var title = ""
    @State var text = ""
    @State var date = Date()
    @State var categoryIndex = 0
    
    private let entryModel: EntryModel
    
    init(entryModel: EntryModel) {
        self.entryModel = entryModel
    }
    
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
            let newEntry = Entry(created: self.date, title: self.title, text: self.text, category: Category(rawValue: self.categoryIndex)!)
            self.presentation.wrappedValue.dismiss()
            self.entryModel.entries.append(newEntry)
        })
    }
}

struct CreateEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateEntryView(entryModel: EntryModel())
        }
    }
}
