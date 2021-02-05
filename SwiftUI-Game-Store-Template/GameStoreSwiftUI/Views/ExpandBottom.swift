//
//  ExpandBottom.swift
//  GameStoreSwiftUI
//
//  Created by Tarokh on 10/10/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct expandBottom : View {
    
    @State var selected = "Information"
    
    var body : some View{
        
        VStack(alignment: .leading,spacing:15){
            
            HStack{
                
                Image("logo").renderingMode(.original)
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("Cat Quest")
                    Text("kavsoft")
                    Image("os")
                    
                }.padding(.leading, 10)
                
                Spacer()
                
                Button(action: {
                    
                    
                }) {
                    
                    Image("heartplus").renderingMode(.original).resizable().frame(width: 22, height: 20)
                    
                }
                .padding(.bottom, 35)
            }
            
            HStack(spacing: 15){
                
                Spacer()
                
                Text("$9.99").foregroundColor(Color("Color"))
                
                Button(action: {
                    
                }) {
                    
                    Text("Add to Cart").padding(.horizontal,16).padding(.vertical, 10)
                    
                }.foregroundColor(.white)
                .background(Capsule().fill(Color("Color")))
                
            }
            
            Text("Screenshots").fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(infos,id: \.self){i in
                        
                        Image(i).renderingMode(.original)
                        
                    }
                }
                
            }.padding(.vertical, 15)
            
            HStack{
                
                Spacer()
                
                ForEach(options,id: \.self){i in
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        Text(i)
                            .padding()
                            .font(.system(size: 18))
                            .foregroundColor(self.selected == i ? Color("Color") : Color.gray)
                            .overlay(
                        
                            Capsule()
                                .fill(self.selected == i ? Color("Color") : Color.clear)
                                .frame(height: 5)
                                .padding(.top, 30)
                        
                        )
                    }
                    
                }
                
                Spacer()
                
            }
            
            if self.selected == "Information"{
                
                Text("Leap into a grand adventure of dragons, magic and cats in purr-suit of the evil Drakoth and your catnapped sister! Explore Felingard's huge overworld map, risk life and limb delving into dungeons for epic loot, and lend a paw to a furry cast of characters in a flurry of side quests.").padding()
            }
            
        }.padding()
        .animation(.spring())
    }
}
