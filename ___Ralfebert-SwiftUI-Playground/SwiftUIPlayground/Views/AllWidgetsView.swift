// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct AllWidgetsView: View {

    var body: some View {
        NavigationView {
            Form {
                Group {
                    Section(header: Text("Button")) {
                        NavigationLink(destination: ButtonExampleView()) {
                            Text("Button Example")
                        }
                    }
                    Section(header: Text("DatePicker")) {
                        DatePickerExampleView()
                    }
                    Section(header: Text("EditButton")) {
                        NavigationLink(destination: EditButtonExampleView()) {
                            Text("Edit Button Example")
                        }
                    }
                    Section(header: Text("Form")) {
                        NavigationLink(destination: ContactFormView()) {
                            Text("Form Example")
                        }
                    }
                    Section(header: Text("Image")) {
                        ImageExampleView()
                            .padding()
                    }
                    Section(header: Text("List")) {
                        ListExampleView()
                    }
                    Section(header: Text("NavigationView/NavigationLink")) {
                        NavigationLink(destination: NavigationContentView()) {
                            Text("Navigation Example")
                        }
                    }
                    Section(header: Text("Picker")) {
                        NavigationLink(destination: PickerExampleView()) {
                            Text("Picker Example")
                        }
                    }
                    Section(header: Text("ScrollView")) {
                        ScrollViewExample()
                    }
                    Section(header: Text("Section")) {
                        NavigationLink(destination: ContactFormView()) {
                            Text("See Form Example")
                        }
                    }
                }
                // it's true, a view function builder cannot take more than 10 views as of Xcode 11.4
                Group {
                    Section(header: Text("Slider")) {
                        SliderExampleView()
                    }
                    Section(header: Text("Stepper")) {
                        StepperExampleView()
                    }
                    Section(header: Text("TabView")) {
                        Text("This is embedded in a TabView, see MainView.swift")
                    }
                    Section(header: Text("Text")) {
                        TextExampleView()
                    }
                    Section(header: Text("TextField, SecureField")) {
                        TextFieldExampleView()
                    }
                    Section(header: Text("Toggle")) {
                        ToggleExampleView()
                    }
                }
            }
            .navigationBarTitle("All Widgets")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}

struct AllWidgetsView_Previews: PreviewProvider {
    static var previews: some View {
        AllWidgetsView()
    }
}
