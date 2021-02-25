//
//  TabButton.swift
//  FB Mac
//
//  Created by Balaji on 15/12/20.
//

import SwiftUI

struct TabButton : View {
    
    var image: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View{
        
        Button(action: {
            withAnimation{selected = image}
        }, label: {
            
            VStack(spacing: 0){
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(selected == image ? Color("fb") : Color.gray.opacity(0.7))
                    .frame(height: 40)
                
                ZStack{
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 65, height: 3)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                    
                    if selected == image{
                        
                        Capsule()
                            .fill(Color("fb"))
                            .frame(width: 65, height: 3)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

