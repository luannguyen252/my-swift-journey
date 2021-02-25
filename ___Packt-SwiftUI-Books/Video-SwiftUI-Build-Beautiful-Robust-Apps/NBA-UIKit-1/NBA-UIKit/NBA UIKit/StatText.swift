//
//  StatText.swift
//  NBA Player Fun
//
//  Created by zappycode on 6/4/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct StatText : View {
    
    var statName: String
    var statValue: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(statName + ":").font(.system(size: 45)).fontWeight(.bold).padding(.leading, 30)
            Text(statValue).font(.system(size: 45)).fontWeight(.light).padding(.trailing, 30)
            Spacer()
        }.minimumScaleFactor(0.5)
    }
}

#if DEBUG
struct StatText_Previews : PreviewProvider {
    static var previews: some View {
        StatText(statName: "Weight", statValue: "20")
    }
}
#endif
