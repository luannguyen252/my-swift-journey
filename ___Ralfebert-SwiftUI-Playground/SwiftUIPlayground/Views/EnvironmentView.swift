// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// List of all the environment values: https://developer.apple.com/documentation/swiftui/environmentvalues
/// Custom environment keys: https://swiftwithmajid.com/2019/08/21/the-power-of-environment-in-swiftui/#custom-environment-keys
/// Custom editable environment keys like editMode: https://stackoverflow.com/a/61847419/128083
struct EnvironmentView: View {
    @Environment(\.locale) var locale
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.font) var font
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Locale: \(String(describing: locale))")
            Text("Size category: \(String(describing: sizeCategory))")
            Text("horizontalSizeClass: \(String(describing: horizontalSizeClass))")
            Text("verticalSizeClass: \(String(describing: horizontalSizeClass))")
            Text("font: \(String(describing: font))")
            Text("isEnabled: \(String(describing: isEnabled))")
            Text("colorScheme: \(String(describing: colorScheme))")
            Button("Example Button") {}
        }
        .environment(\.isEnabled, false)

    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
