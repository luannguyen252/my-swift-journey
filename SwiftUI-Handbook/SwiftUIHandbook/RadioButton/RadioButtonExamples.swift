//
//  RadioButtonExamples.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 25/12/2020.
//

import SwiftUI

struct RadioButtonExamples: View {
    @State var two: Int?
    @State var one: Int?
    @State var none: Int?
    @State var many: Int?
    
    var body: some View {
        Form {
            Section(header: Text("Custom")) {
                RadioButton(questions: [
                                "Cheese I like cheese, and I think this multi-line text looks okay with the vertical alignment set to firstTextBaseline",
                                "No I prefer vegan cheese"],
                            selected: $two)
            }
            
            Section(header: Text("SINGLE")) {
                RadioButton(questions: ["You can even unselect single items, though I'll probably want a different control altogether for multi-checkbox behaviors"], selected: $one)
            }
            
            Section(header: Text("DEFAULTS")) {
                RadioButton(selected: $none)
            }
            
            Section(header: Text("MANY")) {
                RadioButton(questions: [
                    "1 One",
                    "2 Two",
                    "3 Three",
                    "4 Four",
                ], selected: $many)
            }
            
            Section(header: Text("DISABLED")) {
                RadioButton(selected: $none).disabled(true)
            }
            
            Section(header: Text("EMPTY ARRAY")) {
                RadioButton(questions: [], selected: $none)
            }
            
            Section(header: Text("EMPTY STRING")) {
                RadioButton(questions: [" "], selected: $none)
            }
        }
        .navigationTitle("Radio Buttons")
    }
}

struct RadioButtonExamples_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonExamples()
    }
}

