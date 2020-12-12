//
//  BlurWindow.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct BlurWindow: NSViewRepresentable {
    // MARK: - MAKE BLUR VIEW
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }

    // MARK: - UPDATE VIEW
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {

    }
}

// MARK: - PREVIEW
struct BlurWindow_Previews: PreviewProvider {
    static var previews: some View {
        BlurWindow()
    }
}
