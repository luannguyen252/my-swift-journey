//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 07/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    // Liquid Swipe OFfset...
    @State var offset: CGSize = .zero
    
    @State var showHome = false
    
    var body: some View{
        
        ZStack{
            
            Color("bg")
                // give content Before Clipping...
                .overlay(
                
                    // Content...
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("For Gamers")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.")
                            .font(.caption)
                            .fontWeight(.bold)
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal,30)
                    .offset(x: -15)
                )
                .clipShape(LiquidSwipe(offset: offset))
                .ignoresSafeArea()
                // arrow...
                .overlay(
                
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        // For Draggesture to identify...
                        .frame(width: 50, height: 50)
                        .contentShape(Rectangle())
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            // animating swipe offset...
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                offset = value.translation
                            }
                        }).onEnded({ (value) in
                            
                            let screen = UIScreen.main.bounds
                            
                            withAnimation(.spring()){
                                
                                // validating....
                                if -offset.width > screen.width / 2{
                                    // removing view...
                                    offset.width = -screen.height
                                    showHome.toggle()
                                }
                                else{
                                    offset = .zero
                                }
                            }
                            
                        }))
                        .offset(x: 15,y: 58)
                    // hiding while dragging starts...
                        .opacity(offset == .zero ? 1 : 0)
                    
                    ,alignment: .topTrailing
                )
                .padding(.trailing)
            
            if showHome{
                
                Text("Welcome To Home !!!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .onTapGesture {
                        
                        // resetting View...
                        // Just for tutorial....
                        // customize for your own...
                        withAnimation(.spring()){
                            offset = .zero
                            showHome.toggle()
                        }
                    }
            }
        }
    }
}

// Custom Shape...

struct LiquidSwipe: Shape {
    
    // getting Offset Value...
    var offset: CGSize
    
    // animating Path....
    var animatableData: CGSize.AnimatableData{
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            // when user moves left...
            // increasing size both in top and bottom....
            // so it will create a liquid swipe effect...
            
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            // First Constructing Rectangle Shape...
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            // Now Constructing Curve Shape....
            
            // from
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            
            // Also Adding Height...
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            // Mid Between 80 - 180.....
            let mid : CGFloat = 80 + ((to - 80) / 2)

            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}
