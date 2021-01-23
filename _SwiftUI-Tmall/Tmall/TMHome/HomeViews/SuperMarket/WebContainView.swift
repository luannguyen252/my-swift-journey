//
//  WebContainView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct WebContainView: View {
    

    @State  var html: String
    
    var body: some View {
        
        Group {
            if html.count > 0 {
                TmallMarketView(html: $html)
                    .edgesIgnoringSafeArea(.all)
                    .padding(.top,-100)
                
                
            } else {
                ThemeChoiceView()
            }
        }
        
        
    }
}

#if DEBUG
struct WebContainView_Previews: PreviewProvider {
    static var previews: some View {
        WebContainView(html: "https://chaoshi.tmall.com")
    }
}
#endif
