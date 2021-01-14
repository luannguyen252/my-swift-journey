//
// PreviewUtilsExamples.swift
// Examples
//
// Created by CypherPoet on 8/19/20.
// ✌️
//

import SwiftUI


struct PreviewUtilsExamples {

}


// MARK: - `View` Body
extension PreviewUtilsExamples: View {

    var body: some View {
        List {
            NavigationLink(destination: PreviewUtils_DevicesNamesExample()) {
                Text("Device Names")
            }
            NavigationLink(destination: PreviewUtils_ScreenPreviewHelperExample()) {
                Text("Screen Preview Helper")
            }
        }
        .navigationTitle("Preview Utils")
    }
}


// MARK: - Computeds
extension PreviewUtilsExamples {
}


// MARK: - View Variables
private extension PreviewUtilsExamples {
}


// MARK: - Private Helpers
private extension PreviewUtilsExamples {
}


#if DEBUG
// MARK: - Previews
struct PreviewUtilsExamples_Previews: PreviewProvider {

    static var previews: some View { RootView_Previews.previews }
}
#endif
