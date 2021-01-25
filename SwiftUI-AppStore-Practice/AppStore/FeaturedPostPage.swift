//
//  FeaturedPostView.swift
//  AppStore
//
//  Created by jb on 2020/10/08.
//

import Foundation
import SwiftUI

struct FeaturedPostView : View {
    var captionText: String
    var titleText: String
    var subTitleText: String
    var image: String
    var body: some View{
        VStack(alignment: .leading) {
            Text(captionText).font(.caption).foregroundColor(.blue)
            Text(titleText)
            Text(subTitleText).font(.subheadline).foregroundColor(.gray)
            Image(image).resizable()
                .frame(width:
                        (UIApplication.shared.windows.first?.frame.width ?? 0) - 20, height:230, alignment: .center).cornerRadius(5)
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(10)
    }
}


struct FeaturedPostView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedPostView(captionText: "New Update", titleText: "Instruments FreePlay", subTitleText: "Play Any Instrument You Want!", image: "sims")
    }
}
