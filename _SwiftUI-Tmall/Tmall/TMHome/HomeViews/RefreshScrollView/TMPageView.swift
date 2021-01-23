//
//  TMPageView.swift
//  Tmall
//
//  Created by panzhijun on 2019/9/2.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct TMPageView: View {
    
    @EnvironmentObject var home: HomeGlobal
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color(red: 200/255.0, green: 200/255.0, blue: 200/255.0)
                .frame(width: 150,height: 2)
                .cornerRadius(1)
            VStack {
                Color.white
                    .frame(width: 15,height: 2)
                    .cornerRadius(2)
        
            }.offset(x: CGFloat(self.home.index)*15, y: 0 )
            
                        
        }
    }
}

struct TMPageView_Previews: PreviewProvider {
    static var previews: some View {
        TMPageView().environmentObject(HomeGlobal())
    }
}
