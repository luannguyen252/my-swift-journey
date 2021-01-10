import SwiftUI
import NeumorphismUI

@main
struct CoffeeApp: App {
    let neumorphism: NeumorphismManager = .init(isDark: false, lightColor: Color(hex: "C1D2EB"), darkColor: Color(hex: "C1D2EB"))

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(neumorphism)
        }
    }
}
