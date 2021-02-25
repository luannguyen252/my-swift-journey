//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class BindingExamples: ObservableObject {
    @Published var color = Color.green
    @Published var date = Date()
    @Published var slider = 0.75
    @Published var stepper = 25
    @Published var text = "This is a one-way bind"
    @Published var textField = "This is a two-way bind"
    @Published var textEditor = "TextEditor data"
    @Published var toggle = true
}

struct StateObject_BindingWithOtherViews: View {
    @StateObject private var examples = BindingExamples()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("StateObject",
                       subtitle: "Binding with Other Views",
                       desc: "Here are some examples of binding with other views using a @StateObject property.", back: .green)
            
            Form {
                ColorPicker("Color Picker", selection: $examples.color)
                DatePicker(selection: $examples.date, label: { Text("Date") })
                Slider(value: $examples.slider)
                Stepper(value: $examples.stepper, in: 0...100) { Text("Value: \(examples.stepper)") }
                Text(examples.text)
                TextField("Placeholder", text: $examples.textField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextEditor(text: $examples.textEditor).border(Color.green)
                Toggle("Toggle", isOn: $examples.toggle)
            }
        }
        .font(.title)
    }
}

struct StateObject_BindingWithOtherViews_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_BindingWithOtherViews()
    }
}
