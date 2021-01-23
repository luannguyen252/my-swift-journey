//
//  TMTabMainView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct TMTabMainView: View {
    
    var type: TabBarType
    
    init(_ type: TabBarType) {
        self.type = type
    }
    
    var body: some View {

        switch type {
        case .home:
            return AnyView(TMHomeView())
        case .cat:
            return AnyView(TMCatView())
        case .store:
            return AnyView(TMStoreView())
        default:
            return AnyView(TMMineView())
        }
        
    }
}

#if DEBUG
struct TMTabMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TMTabMainView(.home)
        }

    }
}
#endif
