//
//  ContentView.swift
//  Gesture in SwiftUI
//
//  Created by Md Khaled Hasan Manna on 8/12/19.
//  Copyright © 2019 Md Khaled Hasan Manna. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var dragOffSet  = CGSize.zero
    
    var body: some View {
        
    
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.yellow , .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
                   
        }.frame(width: 200, height: 200)
            .offset(self.dragOffSet)
            .animation(.spring())
        
        .gesture(
        
            DragGesture()
            
                .onChanged({ (value) in
                    self.dragOffSet = value.translation
                })
                .onEnded({ (value) in
                    self.dragOffSet = CGSize.zero
                })
        
        )
            
        
 
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
