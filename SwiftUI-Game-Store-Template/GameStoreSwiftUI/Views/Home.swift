//
//  Home.swift
//  GameStoreSwiftUI
//
//  Created by Tarokh on 10/10/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct Home : View {
    
    @State var selected = "Games"
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack{
                
                Text("Game Store").fontWeight(.heavy).font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
            }.padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(scorlllist,id: \.self){i in
                        
                        Button(action: {
                            
                            self.selected = i
                            
                        }) {
                            
                            Text(i).padding().foregroundColor(self.selected == i ? Color.black : Color.gray).overlay(
                            
                                Capsule()
                                    .fill(self.selected == i ? Color("Color") : Color.clear)
                                    .frame(height: 5)
                                    .padding(.top, 30)
                            
                            )
                        }
                    }
                }
            }

            middleView()
            bottomView()
            
            
        }.padding()
    }
}
