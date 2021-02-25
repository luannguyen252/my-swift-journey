//
//  Home.swift
//  Parallax Carousel
//
//  Created by Balaji on 03/12/20.
//

import SwiftUI

struct Home: View {
    @State var selected : Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        TabView(selection: $selected){
            
            // Images...
            ForEach(1...7,id: \.self){index in
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                    
                    // Geometry Reader For Parallax Effect...
                    
                    GeometryReader{reader in
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // moving view in opposite side
                            // when user starts to swipe...
                            // this will create parallax Effect...
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                            
                    }
                    .frame(height: height / 2)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    // shadow...
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                    // decreasing width by padding...
                    // so outer view only decreased..
                    // inner image will be full width....
                    
                    // Bottom Image...
                    
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -15, y: 25)
                })
                .padding(.horizontal,25)
                
            }
        }
        // page Tab View...
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
