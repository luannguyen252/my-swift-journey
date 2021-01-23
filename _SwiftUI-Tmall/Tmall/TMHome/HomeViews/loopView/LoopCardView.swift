//
//  LoopCardView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct LoopCardView: View {
    var loop: HomeLoopItem
    
    var body: some View {
 
        ZStack {
            Color(.clear).frame(height: 260, alignment: .center)
            
            loop.featureImage?
                .resizable()
                .frame(height: 150)
                .cornerRadius(10)
             .padding(.init(top: 100, leading: 10, bottom: 0, trailing: 10))
        }
        
     

        

      
    }
}

#if DEBUG
struct LoopCardView_Previews: PreviewProvider {
    static var previews: some View {
        LoopCardView(loop: loopData[0])
    }
}
#endif
