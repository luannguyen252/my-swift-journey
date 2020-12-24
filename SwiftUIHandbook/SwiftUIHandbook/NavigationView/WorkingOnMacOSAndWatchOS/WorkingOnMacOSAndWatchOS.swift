//
//  WorkingOnMacOSAndWatchOS.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

#if os(watchOS)
struct NavigationView<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack(spacing: 0) {
            content()
        }
    }
}
#endif

#if os(macOS)
extension View {
    func navigationBarTitle(_ title: String) -> some View {
        self
    }
}
#endif

struct WorkingOnMacOSAndWatchOS: View {
    // MARK: - BODY
    var body: some View {
        Text("Hello, World!")
    }
}

// MARK: - PREVIEW
struct WorkingOnMacOSAndWatchOS_Previews: PreviewProvider {
    static var previews: some View {
        WorkingOnMacOSAndWatchOS()
    }
}
