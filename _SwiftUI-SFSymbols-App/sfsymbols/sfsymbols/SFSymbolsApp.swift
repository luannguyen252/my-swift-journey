import SwiftUI

@main
struct SFSymbolsApp: App {
    @StateObject private var model = SymbolModel()
    
    var body: some Scene {
        WindowGroup {
            SymbolList(model: model)
        }
    }
}
