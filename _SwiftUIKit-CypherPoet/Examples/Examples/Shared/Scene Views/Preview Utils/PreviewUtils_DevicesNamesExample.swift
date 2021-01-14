//
// PreviewUtils_DevicesNamesExample.swift
// Examples
//
// Created by CypherPoet on 8/19/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit



struct PreviewUtils_DevicesNamesExample {}


// MARK: - `View` Body
extension PreviewUtils_DevicesNamesExample: View {

    var body: some View {
        VStack {
            ForEach(PreviewDevice.all, id: \.self.rawValue) { device in
                Text(device.rawValue)
            }
        }
    }
}


// MARK: - Computeds
extension PreviewUtils_DevicesNamesExample {
}


// MARK: - View Variables
private extension PreviewUtils_DevicesNamesExample {
}


// MARK: - Private Helpers
private extension PreviewUtils_DevicesNamesExample {
}


#if DEBUG
// MARK: - Preview
struct PreviewUtils_DevicesNamesExample_Previews: PreviewProvider {

    static var previews: some View {
        PreviewUtils_DevicesNamesExample()
    }
}
#endif
