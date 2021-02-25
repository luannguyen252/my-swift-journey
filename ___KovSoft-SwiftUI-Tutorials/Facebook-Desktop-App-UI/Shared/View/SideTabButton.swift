//
//  SideTabButton.swift
//  FB Mac
//
//  Created by Balaji on 15/12/20.
//

import SwiftUI

struct SideTabButton : View {
    
    var image: String
    var title : String
    var color: String
    var isSystem: Bool
    
    var body: some View{
        
        Button(action: {}, label: {
            
            HStack(spacing: 8){
                
                if isSystem{
                    
                    Image(systemName: image)
                        .font(.system(size: 25))
                        .foregroundColor(Color(color))
                        .frame(width: 25)
                }
                else{
                    Image(image)
                        .resizable()
                        .renderingMode(color == "" ? .original : .template)
                        .foregroundColor(Color(color))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                
                Text(title)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
        })
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideTabButton_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
