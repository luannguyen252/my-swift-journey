//
//  CreateEntryView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 18.01.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct CreateEntryView: View {
    
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
    }
}

struct CreateEntryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEntryView()
    }
}
