// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import Combine
import SwiftUI

/// see https://stackoverflow.com/questions/56822195/how-do-i-use-userdefaults-with-swiftui
/// this assumes the UserDefaults are only changed using the ObservableObject wrapper object
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: self.key) as? T ?? self.defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
        }
    }
}

class TextSettings: ObservableObject {

    @UserDefault("TextCount", defaultValue: 1)
    var count: Int {
        willSet {
            self.objectWillChange.send()
        }
    }

    @UserDefault("TextUppercase", defaultValue: true)
    var upcase: Bool {
        willSet {
            self.objectWillChange.send()
        }
    }

}

struct TextSettingsView: View {
    @EnvironmentObject var settings: TextSettings

    var body: some View {
        Form {
            Picker(selection: $settings.count, label:
                Text("Text Repeat Count")) {
                ForEach(Array(1 ... 5), id: \.self) { value in
                    Text(String(value)).tag(value)
                }
            }

            Toggle(isOn: $settings.upcase) {
                Text("Uppercase")
            }

        }
    }
}

/// Example for a shared @EnvironmentObject/ObservableObject
/// see https://stackoverflow.com/questions/61941322/swiftui-updating-text-after-changes-in-settings/61943534#61943534
struct UserDefaultsExampleView: View {
    @EnvironmentObject var settings: TextSettings

    var body: some View {
        Text(self.text)
            .navigationBarItems(trailing: NavigationLink("Settings", destination: TextSettingsView()))
    }

    var text: String {
        var str = String(repeating: "Hello ", count: Int(settings.count))
        if self.settings.upcase {
            str = str.uppercased()
        }
        return str
    }

}

struct TextWithSettingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDefaultsExampleView()
        }
        .environmentObject(TextSettings())
    }
}
