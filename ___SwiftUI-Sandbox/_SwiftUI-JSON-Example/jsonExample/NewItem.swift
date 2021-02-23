//
//  NewItem.swift
//  jsonExample
//
//  Created by Arnav Motwani on 20/02/21.
//

import SwiftUI

struct NewItem: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var jsonData: jsonData
    
    @State private var valueOne: String = ""
    @State private var valueTwo: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("valueOne", text: $valueOne)
                TextField("valueTwo", text: $valueTwo)
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Add item", action: {
                        jsonData.jsonArray.append(jsonModel(id: UUID(), valueOne: valueOne, valueTwo: valueTwo))
                        jsonData.writeJSON()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    Spacer()
                }
            }
        }
        .navigationTitle("New item")
    }
}
