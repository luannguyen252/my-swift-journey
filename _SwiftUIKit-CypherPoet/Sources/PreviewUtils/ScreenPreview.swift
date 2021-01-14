#if DEBUG

import SwiftUI


public struct ScreenPreview<Screen: View>: View {
    public var screen: Screen

    public var body: some View {
        ForEach(PreviewDevice.all, id: \.self.rawValue) { device in
            ForEach(ColorScheme.allCases, id: \.self) { scheme in
                NavigationView {
                    self.screen
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                .previewDevice(device)
                .colorScheme(scheme)
                .previewDisplayName("\(scheme.previewName): \(device.rawValue)")
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}


extension View {

    public func previewAsScreen() -> some View {
        ScreenPreview(screen: self)
    }
}

#endif
