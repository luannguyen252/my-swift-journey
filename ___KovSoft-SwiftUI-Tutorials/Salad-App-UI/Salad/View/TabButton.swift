//
//  TabButton.swift
//  Salad
//
//  Created by Balaji on 13/11/20.
//

import SwiftUI

struct TabButton: View {
    var image: String
    @Binding var selected : String
    var animation: Namespace.ID
    var body: some View {
        
        Button(action: {
            // changing tab...
            withAnimation(.spring()){selected = image}
        }) {
            
            VStack(spacing: 12){
                
                Image(systemName: image)
                    .font(.system(size: 25))
                    .foregroundColor(selected == image ? .white : .gray)
                
                ZStack{
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 8, height: 8)
                    
                    if selected == image{
                        
                        Circle()
                            .fill(Color.white)
                            // smooth slide animation....
                            .matchedGeometryEffect(id: "Tab", in: animation)
                            .frame(width: 8, height: 8)
                    }
                }
            }
        }
    }
}
