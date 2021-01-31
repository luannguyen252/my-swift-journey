//
//  Subview.swift
//  SwiftUIOnboardingScreen
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct SubView: View {
    // MARK: - PROPERTIES
    var imageString: String
    
    // MARK: - BODY
    var body: some View {
        Image(imageString)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .clipped()
    }
}

// MARK: - PREVIEW
#if DEBUG
struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(imageString: "meditating")
    }
}
#endif
