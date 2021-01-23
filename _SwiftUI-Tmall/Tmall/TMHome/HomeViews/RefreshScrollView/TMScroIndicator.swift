//
//  TMScroIndicator.swift
//  Tmall
//
//  Created by panzhijun on 2019/9/2.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct TMScroIndicator: View {
    
    @EnvironmentObject var home: HomeGlobal
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color(red: 200/255.0, green: 200/255.0, blue: 200/255.0)
                .frame(width: 40,height: 2)
                .cornerRadius(1)
            VStack {
                Color.gray
                    .frame(width: 20,height: 2)
                    .cornerRadius(2)
                    .offset(x: -CGFloat(self.home.categoryX*20)/(75*10/2) >= 20.0 ? 20.0 : -CGFloat(self.home.categoryX*20)/(75*10/2), y: 0 )
                
            }
            
            
        }
    }
}

struct TMScroIndicator_Previews: PreviewProvider {
    static var previews: some View {
        TMScroIndicator().environmentObject(HomeGlobal())
    }
}
