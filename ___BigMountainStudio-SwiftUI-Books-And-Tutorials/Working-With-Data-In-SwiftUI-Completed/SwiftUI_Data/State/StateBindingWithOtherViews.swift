//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct BindingToStateExamples {
    var color = Color.blue
    var date = Date()
    var slider = 0.75
    var stepper = 25
    var text = "This is a one-way bind"
    var textField = "This is a two-way bind"
    var textEditor = "TextEditor data"
    var toggle = true
}

struct StateBindingWithOtherViews: View {
    @State private var examples = BindingToStateExamples()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State",
                       subtitle: "Binding With Other Views",
                       desc: "Here are some examples of binding with other views using a @State property.", back: .blue, textColor: .white)
            Form {
                ColorPicker("Color Picker", selection: $examples.color)
                DatePicker(selection: $examples.date, label: { Text("Date") })
                Slider(value: $examples.slider)
                Stepper(value: $examples.stepper, in: 0...100) { Text("Value: \(examples.stepper)") }
                Text(examples.text)
                TextField("Placeholder", text: $examples.textField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextEditor(text: $examples.textEditor).border(Color.blue)
                Toggle("Toggle", isOn: $examples.toggle)
            }
        }
        .font(.title)
    }
}

struct StateBindingWithOtherViews_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingWithOtherViews()
    }
}
