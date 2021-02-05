//
//  bottomView.swift
//  GameStoreSwiftUI
//
//  Created by Tarokh on 10/10/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct bottomView : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                
                Capsule().fill(Color("Color")).frame(width: 5, height: 25)
                
                Text("New And Trending")
                
                Spacer()
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(bottomlist){i in
                        
                        VStack(alignment:.leading,spacing: 8){
                            
                            Image(i.image).renderingMode(.original)
                            Text(i.name)
                            Image("os")
                            Text(i.price).foregroundColor(Color("Color"))
                        }
                    }
                }
                
            }
        }
    }
}
