//
//  ContentView.swift
//  PropertyWrappersDemo
//
//  Created by Alfian Losari on 10/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var form = MainForm()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Uppercased Wrapper"), footer: Text("Transform string input to uppercased string")) {
                    TextField("Enter text to uppercase", text: $form.textToUppercase)
                    if (!form.uppercasedText.isEmpty) {
                        Text(form.uppercasedText)
                            .font(.headline)
                    }
                }
                
                Section(header: Text("Limit Maximum & Minimum Bounds Wrapper")) {
                    HStack {
                        Text("Min to Max bounds")
                        Spacer()
                        Text("(\(String(Int(MainForm.minimumNumber)))-\(String(Int(MainForm.maximumNumber))))")
                    }
                    
                    VStack {
                        HStack {
                            Text("0")
                            Slider(value: $form.numberValue, in: 0...100, step: 1.0)
                            Text("100")
                        }
                        Text(String(Int(form.numberValue)))
                    }
                    
                    HStack {
                        Text("Wrapped Value")
                        Spacer()
                        Text(String(Int(form.rangedNumber)))
                            .font(.headline)
                    }
                }
                
                Section(header: Text("Projected ISO8601 Date String Wrapper")) {
                    DatePicker(selection: $form.date) {
                        Text("Date")
                    }
                    
                    HStack {
                        Text("Datestring")
                        Spacer()
                        
                        Text(form.$formattedDate)
                            .font(.headline)
                    }
                }
                
                Section(header: Text("Localizable Wrapper"), footer: Text("Assigned Localizable key in the property will be wrapped to locazible string using NSLocalizedString API")) {
                    HStack {
                        Text(MainForm.row1Key)
                        Spacer()
                        Text(form.title)
                            .font(.headline)
                    }
                    HStack {
                        Text(MainForm.row2Key)
                        Spacer()
                        Text(form.subtitle)
                            .font(.headline)
                    }
                }
            }
                
            .navigationBarTitle("Property Wrappers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
