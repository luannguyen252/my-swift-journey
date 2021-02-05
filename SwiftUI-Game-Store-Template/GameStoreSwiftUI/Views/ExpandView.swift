//
//  ExpandView.swift
//  GameStoreSwiftUI
//
//  Created by Tarokh on 10/10/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct ExpandView : View {
    
    @Binding var show : Bool
    
    var body : some View{
        
        VStack{
            
            ZStack{
                
                Image("top").resizable().frame(height: 250)
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                    
                }.foregroundColor(.white)
                
            }.overlay(
            
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            
                            self.show.toggle()
                            
                        }) {
                            
                            Image(systemName: "chevron.left").font(.body)
                            
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search")
                            
                        }.foregroundColor(.white)
                        
                    }.padding()
                    
                    Spacer()
                }
            
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                expandBottom()
            }

        }
    }
}

