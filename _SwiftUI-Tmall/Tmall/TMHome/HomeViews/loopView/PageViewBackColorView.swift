//
//  PageViewBackColorView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct PageViewBackColorView: View {

    var item : HomeLoopItem
    var body: some View {
        Color(.clear)
            .background(item.backColor)
            .edgesIgnoringSafeArea(.top)
 
    }
}

#if DEBUG
struct PageViewBackColorView_Previews: PreviewProvider {
    static var previews: some View {
        PageViewBackColorView(item: loopData[0])
    }
}
#endif
