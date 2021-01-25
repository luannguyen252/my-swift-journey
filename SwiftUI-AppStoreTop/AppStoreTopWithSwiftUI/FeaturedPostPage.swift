//
//  FeaturedPostPage.swift
//  AppStoreTopWithSwiftUI
//
//  Created by park kyung suk on 2020/06/27.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct FeaturedPostPageView: View {
    
    var captionText: String
    var titleText: String
    var subtitleText: String
    var image: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(captionText).font(.caption).foregroundColor(.blue)
            Text(titleText)
Text(subtitleText).font(.subheadline).foregroundColor(.gray)
            Image(image).resizable().scaledToFit().frame(height: 200, alignment: .center).cornerRadius(5)
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding()
    }
}


struct FeaturedPostView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedPostPageView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from Paris", image: "sims")
    }
}
