//
//  TapGestureView.swift
//  Gesture in SwiftUI
//
//  Created by Md Khaled Hasan Manna on 8/12/19.
//  Copyright © 2019 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import SwiftUI

struct TapGestureView : View{
   
    @State private var tapped = false
    @State private var dragOffset  = CGSize.zero
  
     let arrayOfLetters = Array("I love SwiftUI")
    
    
    
    
    var body : some View{
      
        ZStack {
            
            (self.tapped ?  Color.red.edgesIgnoringSafeArea(.all) : Color.blue.edgesIgnoringSafeArea(.all))
                
        .gesture(
            TapGesture(count: 1)
            
                .onEnded({ (value) in
                    
                    self.tapped.toggle()
                    
                })
            
            
            
            )
            
     //Added a tap Gesture
            
            HStack{
                
                ForEach(0..<arrayOfLetters.count){ value in
                    
                    Text(String(self.arrayOfLetters[value])).font(.largeTitle)
                       
                           .offset(self.dragOffset)
                        .animation(Animation.default.delay((Double(value))/20))
                         
                    
                    
                }
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        self.dragOffset = value.translation
                        
                    })
                    .onEnded({ (value) in
                        self.dragOffset = CGSize.zero
                    })
                
                
                
                
                )
            
                
                
            }
            
            
            
            
            
            
        }
        
        
    }
    
    
}

struct TapGestureView_Previews : PreviewProvider{
    
    static var  previews : some View {
        
        TapGestureView()
    }
}


