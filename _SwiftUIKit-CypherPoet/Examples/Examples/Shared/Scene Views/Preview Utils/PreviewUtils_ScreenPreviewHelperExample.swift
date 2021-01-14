//
// PreviewUtils_ScreenPreviewHelperExample.swift
// Examples
//
// Created by CypherPoet on 8/19/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit


struct PreviewUtils_ScreenPreviewHelperExample {
}


// MARK: - `View` Body
extension PreviewUtils_ScreenPreviewHelperExample: View {

    var body: some View {
        Text("View me in Xcode Previews")
    }
}


// MARK: - Computeds
extension PreviewUtils_ScreenPreviewHelperExample {
}


// MARK: - View Variables
private extension PreviewUtils_ScreenPreviewHelperExample {
}


// MARK: - Private Helpers
private extension PreviewUtils_ScreenPreviewHelperExample {
}


#if DEBUG
// MARK: - Preview
struct PreviewUtils_ScreenPreviewHelperExample_Previews: PreviewProvider {

    static var previews: some View {
        PreviewUtils_ScreenPreviewHelperExample()
            .previewAsScreen()
    }
}
#endif
